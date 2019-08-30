package routers

import (
	"MetaLib/templmanager"
	"MetaLib/utils"
	"encoding/gob"
	"fmt"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
	"regexp"
)

const (
	NoLogin = iota
	Logged
	Registration
)

type User struct {
	Uid string
	Status int
	Username string
}

func NewRouter() *mux.Router {
	r := mux.NewRouter()

	gob.Register(&User{})

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
	session, err := utils.Store.Get(r, "session")
	if err != nil {
		log.Fatal(err)
	}

	var user *User
	userVal, ok := session.Values["user"]
	if ok {
		user, ok = userVal.(*User)
		if !ok {
			log.Fatal("User session cast fail:", userVal)
		}
	}

	data := struct {
		User *User
	}{user}
	err = templmanager.RenderTemplate(w, "index.html", data)
	if err != nil {
		log.Fatal(err)
	}
}

func logoutHandler(w http.ResponseWriter, r *http.Request){
	session, err := utils.Store.Get(r, "session")
	if err != nil {
		log.Fatal(err)
	}

	session.Values["user"] = User{}
	err = session.Save(r, w)
	if err != nil {
		log.Fatal(err)
	}

	http.Redirect(w, r, "/", 302)
}

func registerGetHandler(w http.ResponseWriter, r *http.Request) {
	session, err := utils.Store.Get(r, "session")
	if err != nil {
		log.Fatal(err)
	}

	userVal, ok := session.Values["user"]
	if !ok {
		http.Redirect(w, r, "/", 302)
	}
	user, ok := userVal.(*User)
	if !ok {
		log.Fatal("User session cast fail:", userVal)
	}

	if user.Status != Registration {
		http.Redirect(w, r, "/", 302)
	}

	err = templmanager.RenderTemplate(w, "register.html", nil)
	if err != nil {
		log.Fatal(err)
	}
}

func registerPostHandler(w http.ResponseWriter, r *http.Request) {
	username := r.PostFormValue("username")
	usernameRe, err := regexp.Compile(`^\w{2,64}$`)
	if err != nil {
		log.Fatal(err)
	}

	if usernameRe.MatchString(username) {
		session, err := utils.Store.Get(r, "session")
		if err != nil {
			log.Fatal(err)
		}

		userVal, ok := session.Values["user"]
		if !ok {
			http.Redirect(w, r, "/", 302)
		}
		user, ok := userVal.(*User)
		if !ok {
			log.Fatal("User session cast fail:", userVal)
		}

		if user.Status != Registration {
			_, err = fmt.Fprint(w, "no registration status", user)
			if err != nil {
				log.Fatal(err)
			}
			return
		}

		if user.Uid == "" {
			_, err = fmt.Fprint(w, "undefined uid")
			if err != nil {
				log.Fatal(err)
			}
			return
		}

		isUsernameUsed, err := utils.DB.Query("SELECT * FROM users WHERE username = $1;", username)
		if err != nil {
			log.Fatal(err)
		}
		if isUsernameUsed.Next() {
			_, err = fmt.Fprint(w, "username already used")
			if err != nil {
				log.Fatal(err)
			}
			return
		}

		_, err = utils.DB.Query("INSERT INTO users (uid, username) VALUES ($1, $2);", user.Uid, username) // check if username exist
		if err != nil {
			log.Fatal(err)
		}

		user.Username = username
		user.Status = Logged
		session.Values["user"] = user

		err = session.Save(r, w)
		if err != nil {
			log.Fatal(err)
		}

		_, err = fmt.Fprint(w, "registered")
		if err != nil {
			log.Fatal(err)
		}
	} else {
		_, err = fmt.Fprint(w, "invalid username")
		if err != nil {
			log.Fatal(err)
		}
	}
}

func authHandler(w http.ResponseWriter, r *http.Request) {
	session, err := utils.Store.Get(r, "session")
	if err != nil {
		log.Fatal(err)
	}

	token := r.PostFormValue("token")
	err = utils.VerifyGoogleID(token)
	if err == nil {
		googleUser, err := utils.DecodeGoogleToken(token)
		if err != nil {
			log.Fatal(err)
		}
		is, err := utils.DB.Query("SELECT uid, username FROM users WHERE uid = $1 LIMIT 1;", googleUser.Sub)
		defer func() {
			err = is.Close()
			if err != nil {
				log.Fatal(err)
			}
		}()
		if err != nil {
			log.Fatal(err)
		}

		var user User

		if is.Next() {
			err := is.Scan(&user.Uid, &user.Username)
			if err != nil {
				log.Fatal(err)
			}

			user.Status = Logged
			session.Values["user"] = user

			err = session.Save(r, w)
			if err != nil {
				log.Fatal(err)
			}

			_, err = fmt.Fprint(w, "logged")
			if err != nil {
				log.Fatal(err)
			}

			log.Info("Login:", user)
		} else {
			user.Uid = googleUser.Sub
			user.Status = Registration
			session.Values["user"] = user

			err = session.Save(r, w)
			if err != nil {
				log.Fatal(err)
			}

			_, err = fmt.Fprint(w, "register")
			if err != nil {
				log.Fatal(err)
			}
		}
	} else {
		//	FIX LATER
		log.Error("User not verified")
	}
}
