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
	Id       uint
	Uid      string
	Status   UserStatus `gorm:"-"`
	Username string
}

type UserBook struct {
	Id     uint
	BookId uint
	Book   *Book
	UserId uint
	User   *User
	Status int
}

type UserTop struct {
	Id     uint
	BookId uint
	Book   *Book
	UserId uint
	Pos    int
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
			session.Values["user"] = User{}
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

func GetUserRW(r *http.Request, w http.ResponseWriter) (*User, error) {
	session := utils.GetSession(r, w)

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

func (u *User) GetRecommendations() ([]*Book, error) {
	var userTops []*UserTop
	err := utils.DB.Where("user_id = ?", u.Id).Set("gorm:auto_preload", true).Find(&userTops).Error
	if err != nil {
		return nil, err
	}
	recommended := make([]*Book, len(userTops))
	for _, ut := range userTops {
		recommended[ut.Pos] = ut.Book
	}
	return recommended, nil
}
