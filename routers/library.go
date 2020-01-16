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

func libraryHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	libraryId, err := strconv.ParseUint(vars["id"], 10, 64)
	if err != nil {
		log.Error(err)
	}

	library, libraryErr := models.GetLibraryById(uint(libraryId))

	err = templmanager.RenderTemplate(w, r, "library.html", struct {
		Library    *models.Library
		LibraryErr error
	}{Library: library, LibraryErr: libraryErr})
	if err != nil {
		log.Fatal(err)
	}
}

func librariesHandler(w http.ResponseWriter, r *http.Request) {
	var librariesErr error

	var libraries []models.Library
	notFound := utils.DB.Find(&libraries).RecordNotFound()
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


	err := templmanager.RenderTemplate(w, r, "libraries.html", struct {
		Order     map[rune][]models.Library
		LibrariesErr error
	}{Order: order, LibrariesErr: librariesErr})
	if err != nil {
		log.Fatal(err)
	}
}
