package models

import (
	"MetaLib/utils"
	"fmt"
	"github.com/gorilla/sessions"
)

type UserStatus int
const (
	NoLogin UserStatus = iota
	Logged
	Registration
)

type User struct {
	Uid      string
	Status   UserStatus `gorm:"-"`
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
			if (utils.DB.First(&User{}, "uid = ?", user.Uid).RecordNotFound()){
				return nil, &UserError{fmt.Sprint("No such user:", user), NoSuchUser}
			}
		}
	}else {
		return nil, &UserError{"No user in session", EmptySession}
	}
	return user, nil
}