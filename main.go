package main

import (
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"github.com/t-tomalak/logrus-easy-formatter"
	"html/template"
	"net/http"
	"os"
)

func init() {
	log.SetFormatter(&easy.Formatter{
		TimestampFormat: "2006-01-02 15:04:05",
		LogFormat:       "[%lvl%]: %time% - %msg%",
	})
}

var templates *template.Template

func main() {
	port := os.Getenv("PORT")

	templates = template.Must(template.ParseGlob("templates/*.html"))

	r := mux.NewRouter()

	r.HandleFunc("/", indexGetHandler).Methods("GET")

	fs := http.FileServer(http.Dir("./static/"))
	r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", fs))

	http.Handle("/", r)

	log.Info("Start listening on port: " + port)
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatal(err)
	}
}

func indexGetHandler(w http.ResponseWriter, r *http.Request) {
	err := templates.ExecuteTemplate(w, "index.html", nil)
	if err != nil {
		log.Fatal(err)
	}
}
