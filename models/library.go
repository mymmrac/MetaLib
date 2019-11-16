package models

import (
	"MetaLib/utils"
	"errors"
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

func GetLibraryById(id uint) (*Library, error) {
	var library Library
	notExist := utils.DB.Set("gorm:auto_preload", true).First(&library, id).RecordNotFound()
	if notExist {
		return nil, errors.New("library not exist")
	} else {
		return &library, nil
	}
}
