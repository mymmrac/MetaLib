package main

import (
	"fmt"
	"github.com/futurenda/google-auth-id-token-verifier"
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
		LogFormat:       "[%lvl%]: %time% - %msg%\n",
	})
}

var templates *template.Template
var gVerifier googleAuthIDTokenVerifier.Verifier

const (
	GOOGLE_CLIENT_ID = "318274972846-q5qllaspjo6nptvddav5p7ipbigjlli3.apps.googleusercontent.com"
)

func main() {
	port := os.Getenv("PORT")

	gVerifier = googleAuthIDTokenVerifier.Verifier{}

	templates = template.Must(template.ParseGlob("templates/*.html"))

	r := mux.NewRouter()

	r.HandleFunc("/", indexGetHandler).Methods("GET")
	r.HandleFunc("/func/auth", authPostHandler).Methods("POST")

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
	data := struct {
		ClientID string
	}{GOOGLE_CLIENT_ID}
	err := templates.ExecuteTemplate(w, "index.html", data)
	if err != nil {
		log.Fatal(err)
	}
}

func authPostHandler(w http.ResponseWriter, r *http.Request) {
	token := r.PostFormValue("token")
	err := gVerifier.VerifyIDToken(token, []string{GOOGLE_CLIENT_ID,})
	if err == nil {
		user, err := googleAuthIDTokenVerifier.Decode(token)
		if err == nil {
			fmt.Println(user.Sub)
		}
	}
}
