package routers

import (
	"MetaLib/models"
	"MetaLib/templmanager"
	"MetaLib/utils"
	"errors"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
	"strconv"
)

func LibraryHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	libraryId, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error(err)
	}

	library, libraryErr := models.GetLibraryById(libraryId)

	err = templmanager.RenderTemplate(w, r, "library.html", struct {
		Library    *models.Library
		LibraryErr error
	}{Library: library, LibraryErr: libraryErr})
	if err != nil {
		log.Fatal(err)
	}
}

func librariesHandler(w http.ResponseWriter, r *http.Request) {
	var libraries []models.Library
	var librariesErr error
	notFind := utils.DB.Order("name desc").Find(&libraries).RecordNotFound()
	if notFind {
		librariesErr = errors.New("libraries not found")
	}

	err := templmanager.RenderTemplate(w, r, "libraries.html", struct {
		Libraries  []models.Library
		LibrariesErr error
	}{Libraries: libraries, LibrariesErr: librariesErr})
	if err != nil {
		log.Fatal(err)
	}
}
