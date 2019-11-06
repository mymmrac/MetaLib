package models

import (
	"MetaLib/utils"
	"errors"
)

type Book struct {
	Id       int
	Name     string
	Year     int
	Rating   float64
	GenreId  int
	Genre    *Genre
	AuthorId int
	Author   *Author
	Cover    string
}

func GetBookById(id int) (*Book, error) {
	var book Book
	notExist := utils.DB.Set("gorm:auto_preload", true).First(&book, id).RecordNotFound()
	if notExist {
		return nil, errors.New("book not exist")
	} else {
		return &book, nil
	}
}
