package routers

import (
	"MetaLib/models"
	"MetaLib/templmanager"
	"MetaLib/utils"
	"errors"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
	"sort"
	"strconv"
	"time"
)

func bookHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	bookId, err := strconv.ParseUint(vars["id"], 10, 64)
	if err != nil {
		log.Error(err)
	}

	book, bookErr := models.GetBookById(uint(bookId))

	var librariesErr error

	var libraries []models.Library
	notFound := utils.DB.Joins("left join library_books on libraries.id = library_books.library_id").Where("book_id = ?", book.Id).Find(&libraries).RecordNotFound()
	if notFound {
		librariesErr = errors.New("libraries not found")
	}

	order := make(map[rune][]models.Library)
	for _, library := range libraries {
		firstRune := (rune)(library.Name[0])
		order[firstRune] = append(order[firstRune], library)
	}

	for _, a := range order {
		sort.Slice(a[:], func(i, j int) bool {
			return a[i].Name < a[j].Name
		})
	}

	var userRatingNumber int
	var userBookStatus int

	session := utils.GetSession(r, w)
	user, err := models.GetUser(session)
	isUserLogged := err == nil && user.Status == models.Logged
	if isUserLogged && user != nil {
		var userRating models.Rating
		userRatingNotFound := utils.DB.Where("user_id = ? and book_id = ?", user.Id, bookId).First(&userRating).RecordNotFound()

		if userRatingNotFound {
			userRatingNumber = 0
		} else {
			userRatingNumber = userRating.Rating
		}

		var userBook models.UserBook
		userBookNotFound := utils.DB.Where("user_id = ? and book_id = ?", user.Id, bookId).First(&userBook).RecordNotFound()

		if userBookNotFound {
			userBookStatus = 0
		} else {
			userBookStatus = userBook.Status
		}
	}

	ratingStars := make([]int, 10)
	for i := range ratingStars {
		ratingStars[i] = 10 - i
	}

	var comments []models.Comment
	utils.DB.Order("time desc").Where("book_id = ?", book.Id).Set("gorm:auto_preload", true).Find(&comments)

	err = templmanager.RenderTemplate(w, r, "book.html", struct {
		Book           *models.Book
		BookErr        error
		IsUser         bool
		UserRating     int
		RatingStars    []int
		BookStatus     int
		Comments       []models.Comment
		LibrariesOrder map[rune][]models.Library
		LibrariesErr   error
	}{Book: book, BookErr: bookErr, IsUser: isUserLogged, UserRating: userRatingNumber, RatingStars: ratingStars, BookStatus: userBookStatus, Comments: comments, LibrariesOrder: order, LibrariesErr: librariesErr})
	if err != nil {
		log.Fatal(err)
	}
}

func commentHandler(w http.ResponseWriter, r *http.Request) {
	if err := utils.ParseForm(r); err != nil {
		log.Error(err)
		return
	}

	text, ok := utils.FormGetStr(r, "comment")
	if !ok {
		log.Error("Failed to get text")
		return
	}

	vars := mux.Vars(r)
	bookId, err := strconv.ParseUint(vars["id"], 10, 64)
	if err != nil {
		log.Error(err)
	}

	user, err := models.GetUserRW(r, w)
	if err != nil {
		log.Error(err)
		return
	}

	comment := models.Comment{Text: text, Time: time.Now(), BookId: uint(bookId), UserId: user.Id}
	if err := utils.DB.Create(&comment).Error; err != nil {
		log.Error(err)
	}

	http.Redirect(w, r, "/book/"+strconv.FormatUint(bookId, 10), 302)
}

func booksHandler(w http.ResponseWriter, r *http.Request) {
	perPage := 20
	displayPages := 7

	var count int
	utils.DB.Model(&models.Book{}).Count(&count)

	pages := count/perPage + 1
	if count%perPage == 0 {
		pages--
	}

	pageString := r.URL.Query().Get("page")
	if len(pageString) == 0 {
		pageString = "1"
	}

	var booksErr error
	page, err := strconv.Atoi(pageString)
	if err != nil {
		booksErr = errors.New("bad page")
	}

	startFrom := page - displayPages/2
	if startFrom <= 0 {
		startFrom = 1
	}

	endTo := page + displayPages/2
	if endTo > pages {
		endTo = pages
	}

	pagesSqn := make([]int, endTo-startFrom+1)

	for i := startFrom; i <= endTo; i++ {
		ind := i - startFrom
		pagesSqn[ind] = i
	}

	var books []models.Book
	offset := (page - 1) * perPage
	notFind := utils.DB.Order("rating desc, id").Offset(offset).Limit(perPage).Set("gorm:auto_preload", true).Find(&books).RecordNotFound()
	if notFind {
		booksErr = errors.New("books not found")
	}

	var userBooks []models.UserBook

	user, err := models.GetUserRW(r, w)
	if user == nil {
		log.Error(err)
	} else {
		if user.Status == models.Logged {
			if err := utils.DB.Where("user_id = ?", user.Id).Find(&userBooks).Error; err != nil {
				log.Error(err)
			}
		}
	}

	var nextPage, previousPage int
	if page+1 > pages {
		nextPage = page
	} else {
		nextPage = page + 1
	}
	if page-1 > 0 {
		previousPage = page - 1
	} else {
		previousPage = page
	}

	err = templmanager.RenderTemplate(w, r, "books.html", struct {
		Books        []models.Book
		BooksErr     error
		Page         int
		Pages        []int
		NextPage     int
		PreviousPage int
		PageCount    int
		UserBooks    []models.UserBook
	}{Books: books, BooksErr: booksErr, Page: page, Pages: pagesSqn, NextPage: nextPage, PreviousPage: previousPage, PageCount: pages, UserBooks: userBooks})
	if err != nil {
		log.Fatal(err)
	}
}

func starHandler(w http.ResponseWriter, r *http.Request) {
	if err := utils.ParseForm(r); err != nil {
		log.Error(err)
		return
	}

	rating, ok := utils.FormGetInt(r, "rating")
	if !ok {
		log.Error("Failed to get rating")
		return
	}

	bookId, ok := utils.FormGetUint(r, "book-id")
	if !ok {
		log.Error("Failed to get book id")
		return
	}

	user, err := models.GetUserRW(r, w)
	if err != nil {
		log.Error(err)
		return
	}

	err = utils.DB.Where(models.Rating{UserId: user.Id, BookId: bookId}).Assign(models.Rating{Rating: rating}).FirstOrCreate(&models.Rating{}).Error
	if err != nil {
		log.Error(err)
	}

	w.WriteHeader(http.StatusOK)
}

func setStatusHandler(w http.ResponseWriter, r *http.Request) {
	if err := utils.ParseForm(r); err != nil {
		log.Error(err)
		return
	}

	status, ok := utils.FormGetInt(r, "status")
	if !ok {
		log.Error("Failed to get status")
		return
	}

	bookId, ok := utils.FormGetUint(r, "book-id")
	if !ok {
		log.Error("Failed to get book id")
		return
	}

	user, err := models.GetUserRW(r, w)
	if err != nil {
		log.Error(err)
		return
	}

	if status == 0 {
		err = utils.DB.Model(&models.UserBook{}).Where(&models.UserBook{UserId: user.Id, BookId: bookId}).Update("status", 0).Error
	} else {
		err = utils.DB.Where(&models.UserBook{UserId: user.Id, BookId: bookId}).Assign(&models.UserBook{Status: status}).FirstOrCreate(&models.UserBook{}).Error
	}

	if err != nil {
		log.Error(err)
	}

	w.WriteHeader(http.StatusOK)
}
