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

func genreHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	genreId, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error(err)
	}

	genre, genreErr := models.GetGenreById(uint(genreId))
	var books []models.Book

	if genreErr == nil {
		utils.DB.Where("genre_id = ?", genre.Id).Order("rating").Find(&books)
	}

	err = templmanager.RenderTemplate(w, r, "genre.html", struct {
		Genre    *models.Genre
		Books    []models.Book
		GenreErr error
	}{genre, books, genreErr})
	if err != nil {
		log.Fatal(err)
	}
}

func genresHandler(w http.ResponseWriter, r *http.Request) {
	var genresErr error

	var genres []models.Genre
	notFound := utils.DB.Find(&genres).RecordNotFound()
	if notFound {
		genresErr = errors.New("genres not found")
	}

	order := make(map[rune][]models.Genre)
	for _, genre := range genres {
		firstRune := (rune)(genre.Name[0])
		order[firstRune] = append(order[firstRune], genre)
	}

	for _, a := range order {
		sort.Slice(a[:], func(i, j int) bool {
			return a[i].Name < a[j].Name
		})
	}

	err := templmanager.RenderTemplate(w, r, "genres.html", struct {
		Order     map[rune][]models.Genre
		GenresErr error
	}{Order: order, GenresErr: genresErr})
	if err != nil {
		log.Fatal(err)
	}
}
