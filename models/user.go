package models

import (
	"MetaLib/utils"
	"fmt"
	"github.com/gorilla/sessions"
	log "github.com/sirupsen/logrus"
)

type UserStatus int
const (
	NoLogin UserStatus = iota
	Logged
	Registration
)

type User struct {
	Uid      string
	Status   UserStatus
	Username string
}

type UserErrorCode int

const (
	EmptySession UserErrorCode = iota
	ConvertFailed
	NoSuchUser
)

type UserError struct {
	message string
	code UserErrorCode
}

func (u UserError) Code() UserErrorCode {
	return u.code
}

func (u UserError) Error() string {
	return u.message
}

func GetUser(session *sessions.Session) (*User, error) {
	var user *User
	userVal, ok := session.Values["user"]
	if ok {
		user, ok = userVal.(*User)
		if !ok {
			return nil, &UserError{"Convert to user failed", ConvertFailed}
		}
		if user.Status != NoLogin && user.Status != Registration {
			is, err := utils.DB.Query("SELECT EXISTS(SELECT uid FROM users WHERE uid = $1 LIMIT 1);", user.Uid)
			defer func() {
				err = is.Close()
				if err != nil {
					log.Fatal(err)
				}
			}()
			if err != nil {
				log.Fatal(err)
			}

			if is.Next() {
				var userExist bool
				err = is.Scan(&userExist)
				if err != nil {
					log.Fatal(err)
				}

				if !userExist {
					return nil, &UserError{fmt.Sprint("No such user:", user), NoSuchUser}
				}
			}else {
				log.Fatal(is.Err())
			}
		}
	}else {
		return nil, &UserError{"No user in session", EmptySession}
	}
	return user, nil
}


