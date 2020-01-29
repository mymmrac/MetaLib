package models

import (
	"MetaLib/utils"
	"errors"
	"time"
)

type Book struct {
	Id          uint
	Name        string
	Year        int
	Rating      float64
	GenreId     uint
	Genre       *Genre
	AuthorId    uint
	Author      *Author
	Cover       string
	Description string
}

type BookStatus int

const (
	NoStatus BookStatus = iota
	Read
	WillRead
	AlreadyRead
	WillNotRead
)

type Comment struct {
	Id     uint
	Text   string
	Time   time.Time
	BookId uint
	Book   Book
	UserId uint
	User   User
}

func GetBookById(id uint) (*Book, error) {
	var book Book
	notExist := utils.DB.Set("gorm:auto_preload", true).First(&book, id).RecordNotFound()
	if notExist {
		return nil, errors.New("book not exist")
	} else {
		return &book, nil
	}
}
