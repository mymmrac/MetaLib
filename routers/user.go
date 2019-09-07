package routers

import (
	"MetaLib/models"
	"MetaLib/templmanager"
	"MetaLib/utils"
	"fmt"
	log "github.com/sirupsen/logrus"
	"net/http"
	"regexp"
)

func logoutHandler(w http.ResponseWriter, r *http.Request) {
	session := utils.GetSession(r)

	session.Values["user"] = models.User{}
	err := session.Save(r, w)
	if err != nil {
		log.Fatal(err)
	}

	http.Redirect(w, r, "/", 302)
}

func registerGetHandler(w http.ResponseWriter, r *http.Request) {
	session := utils.GetSession(r)

	user, err := models.GetUser(session)
	if err != nil {
		userErr, ok := err.(*models.UserError)
		if !ok {
			log.Fatal("Convert error to UserError failed")
		}
		if userErr.Code() == models.EmptySession {
			http.Redirect(w, r, "/", 302)
		} else if userErr.Code() == models.NoSuchUser {
			session.Values["user"] = &models.User{}
			err = session.Save(r, w)
			if err != nil {
				log.Fatal(err)
			}

			http.Redirect(w, r, "/", 302)
		} else {
			log.Fatal(err)
		}
	}

	if user.Status != models.Registration {
		http.Redirect(w, r, "/", 302)
	}

	err = templmanager.RenderTemplate(w, r, "register.html", nil)
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
		session := utils.GetSession(r)

		user, err := models.GetUser(session)
		if err != nil {
			userErr, ok := err.(*models.UserError)
			if !ok {
				log.Fatal("Convert error to UserError failed")
			}
			if userErr.Code() == models.ConvertFailed {
				log.Fatal(err)
			} else {
				http.Redirect(w, r, "/", 302)
			}
		}

		if user.Status != models.Registration {
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
		user.Status = models.Logged
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
	session := utils.GetSession(r)

	token := r.PostFormValue("token")
	err := utils.VerifyGoogleID(token)
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

		var user models.User

		if is.Next() {
			err := is.Scan(&user.Uid, &user.Username)
			if err != nil {
				log.Fatal(err)
			}

			user.Status = models.Logged
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
			user.Status = models.Registration
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
