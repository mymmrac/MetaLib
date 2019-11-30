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
)

func authorHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	authorId, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error(err)
	}

	author, authorErr := models.GetAuthorById(uint(authorId))
	var books []models.Book

	if authorErr == nil {
		utils.DB.Where("author_id = ?", author.Id).Order("rating").Find(&books)
	}

	err = templmanager.RenderTemplate(w, r, "author.html", struct {
		Author    *models.Author
		Books     []models.Book
		AuthorErr error
	}{author, books, authorErr})
	if err != nil {
		log.Fatal(err)
	}
}

func authorsHandler(w http.ResponseWriter, r *http.Request) {
	var authorsErr error

	var authors []models.Author
	notFound := utils.DB.Find(&authors).RecordNotFound()
	if notFound {
		authorsErr = errors.New("authors not found")
	}

	order := make(map[rune][]models.Author)
	for _, author := range authors {
		firstRune := (rune)(author.Name[0])
		order[firstRune] = append(order[firstRune], author)
	}

	for _, a := range order {
		sort.Slice(a[:], func(i, j int) bool {
			return a[i].Name < a[j].Name
		})
	}

	err := templmanager.RenderTemplate(w, r, "authors.html", struct {
		Order      map[rune][]models.Author
		AuthorsErr error
	}{Order: order, AuthorsErr: authorsErr})
	if err != nil {
		log.Fatal(err)
	}
}
