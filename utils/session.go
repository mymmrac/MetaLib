package utils

import (
	"github.com/gorilla/sessions"
	log "github.com/sirupsen/logrus"
	"net/http"
	"os"
)

var Store = sessions.NewCookieStore([]byte(os.Getenv("SESSION_KEY")))

//var Store = sessions.NewCookieStore(securecookie.GenerateRandomKey(32))

func GetSession(r *http.Request, w http.ResponseWriter) *sessions.Session {
	session, err := Store.Get(r, "session")
	if err != nil {
		log.Error(err)
		session.Options.MaxAge = -1

		err = session.Save(r, w)
		if err != nil {
			log.Fatal(err)
		}
	}
	return session
}
