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

func profileHandler(w http.ResponseWriter, r *http.Request) {
	user, err := models.GetUserRW(r, w)
	if err != nil {
		http.Redirect(w, r, "/", 302)
		return
	}

	var read, willRead, alreadyRead, willNotRead []models.UserBook
	utils.DB.Where("user_id = ? and status = ?", user.Id, models.Read).Preload("Book").Find(&read)
	utils.DB.Where("user_id = ? and status = ?", user.Id, models.WillRead).Preload("Book").Find(&willRead)
	utils.DB.Where("user_id = ? and status = ?", user.Id, models.AlreadyRead).Preload("Book").Find(&alreadyRead)
	utils.DB.Where("user_id = ? and status = ?", user.Id, models.WillNotRead).Preload("Book").Find(&willNotRead)

	books := struct {
		Read        []models.UserBook
		WillRead    []models.UserBook
		AlreadyRead []models.UserBook
		WillNotRead []models.UserBook
	}{read, willRead, alreadyRead, willNotRead}

	var userBooksHistory []models.UserBooksHistory
	if err = utils.DB.Where("user_id = ?", user.Id).Set("gorm:auto_preload", true).Find(&userBooksHistory).Error; err != nil {
		log.Error(err)
	}

	err = templmanager.RenderTemplate(w, r, "profile.html", struct {
		User  models.User
		Books struct {
			Read        []models.UserBook
			WillRead    []models.UserBook
			AlreadyRead []models.UserBook
			WillNotRead []models.UserBook
		}
		UserBooksHistory []models.UserBooksHistory
	}{User: *user, Books: books, UserBooksHistory: userBooksHistory})
	if err != nil {
		log.Fatal(err)
	}
}

func logoutHandler(w http.ResponseWriter, r *http.Request) {
	session := utils.GetSession(r, w)

	//session.Options.MaxAge = -1
	session.Values["user"] = models.User{}
	err := session.Save(r, w)
	if err != nil {
		log.Fatal(err)
	}

	http.Redirect(w, r, "/", 302)
}

func registerGetHandler(w http.ResponseWriter, r *http.Request) {
	session := utils.GetSession(r, w)

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

	if user == nil || user.Status != models.Registration {
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
		session := utils.GetSession(r, w)

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

		if user == nil {
			log.Fatal("User is nil")
			return
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

		isUsernameUsed := utils.DB.First(&models.User{}, "username = ?", username).RecordNotFound()
		if !isUsernameUsed {
			_, err = fmt.Fprint(w, "username already used")
			if err != nil {
				log.Fatal(err)
			}
			return
		}

		user.Username = username
		utils.DB.Create(user)

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
	session := utils.GetSession(r, w)

	token := r.PostFormValue("token")
	err := utils.VerifyGoogleID(token)
	if err == nil {
		googleUser, err := utils.DecodeGoogleToken(token)
		if err != nil {
			log.Fatal(err)
		}

		var user models.User

		is := !utils.DB.First(&user, "uid = ?", googleUser.Sub).RecordNotFound()
		if is {
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
