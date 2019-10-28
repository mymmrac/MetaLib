package models

import (
	"MetaLib/utils"
	log "github.com/sirupsen/logrus"
)

type Genre struct {
	Id   int
	Name string
}

func GetGenreById(id int) (*Genre, error) {
	genre, err := utils.DB.Query("SELECT * FROM genres WHERE Id = $1;", id)
	if err != nil {
		return nil, err
	}
	defer func() {
		err = genre.Close()
		if err != nil {
			log.Error(err)
		}
	}()
	if genre.Next() {
		g := Genre{}
		err = genre.Scan(&g.Id, &g.Name)
		if err != nil {
			return nil, err
		}
		return &g, nil
	} else {
		return nil, genre.Err()
	}
}
