package models

import (
	"MetaLib/utils"
	"errors"
)

type Author struct {
	Id   int
	Name string
}

func GetAuthorById(id int) (*Author, error) {
	var author Author
	notExist := utils.DB.First(&author, id).RecordNotFound()
	if notExist {
		return nil, errors.New("author not exist")
	}else{
		return &author, nil
	}
}
