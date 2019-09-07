package utils

import (
	"github.com/gorilla/sessions"
	log "github.com/sirupsen/logrus"
	"net/http"
	"os"
)

var Store = sessions.NewCookieStore([]byte(os.Getenv("SESSION_KEY")))
//var Store = sessions.NewCookieStore(securecookie.GenerateRandomKey(32))

func GetSession(r *http.Request) *sessions.Session {
	session, err := Store.Get(r, "session")
	if err != nil {
		log.Fatal(err)
	}
	return session
}