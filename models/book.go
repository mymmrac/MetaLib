package models

import (
	"MetaLib/utils"
	"errors"
	"fmt"
	log "github.com/sirupsen/logrus"
)

type Book struct {
	Id     int
	Name   string
	Year   int
	Rating float64
	Genre  *Genre
	Author *Author
	Cover  string
}

func GetBooksWhere(where string) ([]*Book, error) {
	books, err := utils.DB.Query(fmt.Sprintf("SELECT * FROM books WHERE %v;", where))
	if err != nil {
		return nil, err
	}
	defer func() {
		err = books.Close()
		if err != nil {
			log.Error(err)
		}
	}()

	var b []*Book;
	for books.Next() {
		book := Book{}
		var genreId, authorId int
		err = books.Scan(&book.Id, &book.Name, &book.Year, &book.Rating, &genreId, &authorId, &book.Cover)
		if err != nil {
			return nil, err
		}

		book.Genre, err = GetGenreById(genreId)
		if err != nil {
			return nil, err
		}

		book.Author, err = GetAuthorById(authorId)
		if err != nil {
			return nil, err
		}

		b = append(b, &book)
	}

	if len(b) > 0 {
		return b, nil
	} else {
		return nil, errors.New("no such books")
	}
}

func GetBookById(id int) (*Book, error) {
	book, err := GetBooksWhere(fmt.Sprintf("id = %v", id))
	if err != nil {
		return nil, err
	}else {
		return book[0], err
	}
}