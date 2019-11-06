package models

import (
	"MetaLib/utils"
	"errors"
)

type Genre struct {
	Id   uint
	Name string
}

func GetGenreById(id int) (*Genre, error) {
	var genre Genre
	notExist := utils.DB.First(&genre, id).RecordNotFound()
	if notExist {
		return nil, errors.New("genre not exist")
	}else{
		return &genre, nil
	}
}
