package routers

import (
	"MetaLib/models"
	"MetaLib/templmanager"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
	"strconv"
)

func NewRouter() *mux.Router {
	r := mux.NewRouter()

	r.HandleFunc("/", indexGetHandler).Methods("GET")

	r.HandleFunc("/register", registerGetHandler).Methods("GET")
	r.HandleFunc("/register", registerPostHandler).Methods("POST")
	r.HandleFunc("/func/auth", authHandler).Methods("POST")
	r.HandleFunc("/logout", logoutHandler).Methods("GET")

	r.HandleFunc("/book/{id:[0-9]+}", bookHandler).Methods("GET")

	fs := http.FileServer(http.Dir("./static/"))
	r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", fs))

	models.GetBookById(1) // REMOVE

	return r
}

func indexGetHandler(w http.ResponseWriter, r *http.Request) {
	err := templmanager.RenderTemplate(w, r, "index.html", nil)
	if err != nil {
		log.Fatal(err)
	}
}

func bookHandler(w http.ResponseWriter, r *http.Request){
	vars := mux.Vars(r)
	bookId, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error(err)
	}

	book, bookErr := models.GetBookById(bookId)

	err = templmanager.RenderTemplate(w, r, "book.html", struct {
		Book *models.Book
		Err error
	}{book, bookErr})
	if err != nil {
		log.Fatal(err)
	}
}
