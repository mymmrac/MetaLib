package models

import (
	"MetaLib/utils"
	log "github.com/sirupsen/logrus"
)

type Author struct {
	Id   int
	Name string
}

func GetAuthorById(id int) (*Author, error) {
	author, err := utils.DB.Query("SELECT * FROM authors WHERE Id = $1;", id)
	if err != nil {
		return nil, err
	}
	defer func() {
		err = author.Close()
		if err != nil {
			log.Error(err)
		}
	}()
	if author.Next() {
		a := Author{}
		err = author.Scan(&a.Id, &a.Name)
		if err != nil {
			return nil, err
		}
		return &a, nil
	} else {
		return nil, author.Err()
	}
}
