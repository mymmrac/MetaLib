package utils

import (
	"github.com/gorilla/sessions"
	"os"
)

var Store = sessions.NewCookieStore([]byte(os.Getenv("SESSION_KEY")))
//var Store = sessions.NewCookieStore(securecookie.GenerateRandomKey(32))