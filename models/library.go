package models

import (
	"MetaLib/utils"
	"errors"
	"time"
)

type City struct {
	Id   uint
	Name string
}

type Library struct {
	Id     uint
	Name   string
	CityId uint
	City   City
}

type LibraryBooks struct {
	Id        uint
	BookID    uint
	Book      Book
	LibraryId uint
	Library   Library
}

type UserBooksHistory struct {
	Id        uint
	UserId    uint
	User      User
	BookId    uint
	Book      Book
	LibraryId uint
	Library   Library
	GetTime   time.Time
	BackTime  *time.Time
}

func (UserBooksHistory) TableName() string {
	return "user_books_history"
}

func GetLibraryById(id uint) (*Library, error) {
	var library Library
	notExist := utils.DB.Set("gorm:auto_preload", true).First(&library, id).RecordNotFound()
	if notExist {
		return nil, errors.New("library not exist")
	} else {
		return &library, nil
	}
}
