package routers

import (
	"MetaLib/templmanager"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
)

func NewRouter() *mux.Router {
	r := mux.NewRouter()

	r.HandleFunc("/", indexGetHandler).Methods("GET")
	r.HandleFunc("/register", registerGetHandler).Methods("GET")
	r.HandleFunc("/register", registerPostHandler).Methods("POST")
	r.HandleFunc("/func/auth", authHandler).Methods("POST")
	r.HandleFunc("/logout", logoutHandler).Methods("GET")

	fs := http.FileServer(http.Dir("./static/"))
	r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", fs))

	return r
}

func indexGetHandler(w http.ResponseWriter, r *http.Request) {
	err := templmanager.RenderTemplate(w, r, "index.html", nil)
	if err != nil {
		log.Fatal(err)
	}
}