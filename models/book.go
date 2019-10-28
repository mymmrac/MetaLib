package models

import (
	"MetaLib/utils"
	"errors"
	log "github.com/sirupsen/logrus"
)

type Book struct {
	Id       int
	Name     string
	Year     int
	Rating   float64
	Genreid  int
	Genre    *Genre
	Authorid int
	Author   *Author
	Cover    string
}

func GetBookById(id int) (*Book, error) {
	var book Book
	notExist := utils.DB.First(&book, id).RecordNotFound()
	if notExist {
		return nil, errors.New("book not exist")
	} else {
		var err error
		book.Genre, err = GetGenreById(book.Genreid)
		if err != nil {
			log.Error(err)
		}
		book.Author, err = GetAuthorById(book.Authorid)
		if err != nil {
			log.Error(err)
		}
		return &book, nil
	}
}