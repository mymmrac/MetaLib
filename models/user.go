package models

import (
	"MetaLib/utils"
	"fmt"
	"github.com/gorilla/sessions"
	"net/http"
)

type UserStatus int

const (
	NoLogin UserStatus = iota
	Logged
	Registration
)

type User struct {
	Id       int
	Uid      string
	Status   UserStatus `gorm:"-"`
	Username string
}

type UserErrorCode int

const (
	EmptySession UserErrorCode = iota
	ConvertFailed
	NoSuchUser
	UserNotLogged
	UserNil
)

type UserError struct {
	message string
	code    UserErrorCode
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
			if (utils.DB.First(&User{}, "uid = ?", user.Uid).RecordNotFound()) {
				return nil, &UserError{fmt.Sprint("No such user:", user), NoSuchUser}
			}
		}
	} else {
		return nil, &UserError{"No user in session", EmptySession}
	}
	return user, nil
}

func GetUserR(r *http.Request) (*User, error) {
	session := utils.GetSession(r)

	user, err := GetUser(session)
	if err != nil {
		return nil, err
	}
	if user == nil {
		return nil, &UserError{"User is nil", UserNil}
	}
	if user.Status != Logged {
		return nil, &UserError{"User not logged", UserNotLogged}
	}
	return user, nil
}
