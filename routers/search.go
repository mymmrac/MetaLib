package routers

import (
	"MetaLib/models"
	"MetaLib/templmanager"
	"MetaLib/utils"
	"fmt"
	log "github.com/sirupsen/logrus"
	"net/http"
	"strconv"
	"strings"
)

func searchHandler(w http.ResponseWriter, r *http.Request) {
	var err error
	if err = r.ParseForm(); err != nil {
		log.Error(err)
		http.Redirect(w, r, "/", 302)
		return
	}

	query := r.FormValue("oq")

	genre := r.FormValue("g")
	author := r.FormValue("a")
	year_ := r.FormValue("y")

	var genreId, authorId, year uint64
	if genre != "" {
		genreId, err = strconv.ParseUint(genre, 10, 32)
		if err != nil {
			log.Error(err)
		}
	}
	if author != "" {
		authorId, err = strconv.ParseUint(author, 10, 32)
		if err != nil {
			log.Error(err)
		}
	}
	if year_ != "" {
		year, err = strconv.ParseUint(year_, 10, 32)
		if err != nil {
			log.Error(err)
		}
	}

	var genreList []models.Genre
	if err := utils.DB.Order("name").Find(&genreList).Error; err != nil {
		log.Error(err)
	}

	var authorList []models.Author
	if err := utils.DB.Order("name").Find(&authorList).Error; err != nil {
		log.Error(err)
	}

	var yearList []uint
	if err := utils.DB.Raw("SELECT DISTINCT year FROM books").Pluck("year", &yearList).Error; err != nil {
		log.Error(err)
	}

	var books []models.Book

	where := ""

	if query != "" {
		where += "to_tsvector(name) @@ to_tsquery('" + strings.ReplaceAll(query, " ", "+") + ":*')"
	}

	if genreId != 0 {
		if where != "" {
			where += " AND"
		}
		where += fmt.Sprintf(" genre_id = %v", genreId)
	}
	if authorId != 0 {
		if where != "" {
			where += " AND"
		}
		where += fmt.Sprintf(" author_id = %v", authorId)
	}
	if year != 0 {
		if where != "" {
			where += " AND"
		}
		where += fmt.Sprintf(" year = %v", year)
	}

	if where != "" {
		if err := utils.DB.Raw("SELECT * FROM books WHERE " + where).Scan(&books).Error; err != nil {
			log.Error(err)
		}
	}

	err = templmanager.RenderTemplate(w, r, "search.html", struct {
		SearchFor    string
		FilterGenre  uint64
		FilterAuthor uint64
		FilterYear   uint64
		Books        []models.Book
		GenreList    []models.Genre
		AuthorList   []models.Author
		YearList     []uint
	}{SearchFor: query, Books: books, GenreList: genreList, AuthorList: authorList, YearList: yearList, FilterGenre: genreId, FilterAuthor: authorId, FilterYear: year})
	if err != nil {
		log.Fatal(err)
	}
}
