package routers

import (
	"MetaLib/templmanager"
	"MetaLib/utils"
	"fmt"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
)

func NewRouter() *mux.Router {
	r := mux.NewRouter()

	r.HandleFunc("/", indexGetHandler).Methods("GET")
	r.HandleFunc("/test", testHadnler).Methods("GET")
	r.HandleFunc("/func/auth", authPostHandler).Methods("POST")

	fs := http.FileServer(http.Dir("./static/"))
	r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", fs))

	return r
}

func testHadnler(w http.ResponseWriter, r *http.Request) {
	data := struct {
		Text string
	}{"Hello"}
	err := templmanager.RenderTemplate(w, "testDB.html", data)
	if err != nil {
		log.Fatal(err)
	}
}

func indexGetHandler(w http.ResponseWriter, r *http.Request) {
	err := templmanager.RenderTemplate(w, "index.html", nil)
	if err != nil {
		log.Fatal(err)
	}

	rows, err := utils.DB.Query("SELECT * FROM test;")
	if err != nil {
		fmt.Println(err)
	} else {
		for rows.Next() {
			var (
				id   int
				text string
			)
			rows.Scan(&id, &text)
			fmt.Println(id, text)
		}
	}
}

func authPostHandler(w http.ResponseWriter, r *http.Request) {
	token := r.PostFormValue("token")
	err := utils.VerifyGoogleID(token)
	if err == nil {
		user, err := utils.DecodeGoogleToken(token)
		if err == nil {
			fmt.Println(user.Sub)
		}
	}
}
