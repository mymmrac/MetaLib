package main

import (
	"MetaLib/models"
	"MetaLib/routers"
	"MetaLib/templmanager"
	"MetaLib/utils"
	"encoding/gob"
	log "github.com/sirupsen/logrus"
	"github.com/t-tomalak/logrus-easy-formatter"
	"net/http"
	"os"
)

func init() {
	log.SetFormatter(&easy.Formatter{
		TimestampFormat: "2006-01-02 15:04:05",
		LogFormat:       "[%lvl%]: %time% - %msg%\n",
	})

	gob.Register(&models.User{})
}

func main() {
	var err error
	port := os.Getenv("PORT")

	err = utils.InitDb()
	if err != nil {
		log.Fatal(err)
	}

	utils.DB.AutoMigrate(&models.Book{}, &models.Genre{}, &models.Author{}, &models.User{})

	utils.InitGoogle()

	templmanager.SetTemplateConfig( "templates/layout/", "templates/", "templates/errors/")
	err = templmanager.LoadTemplates()
	if err != nil {
		log.Fatal(err)
	}

	r := routers.NewRouter()
	http.Handle("/", r)

	log.Info("Start listening on port: " + port)
	err = http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatal(err)
	}
}
