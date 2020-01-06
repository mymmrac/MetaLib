package main

import (
	"MetaLib/models"
	"MetaLib/routers"
	"MetaLib/templmanager"
	"MetaLib/utils"
	"encoding/gob"
	"github.com/robfig/cron/v3"
	log "github.com/sirupsen/logrus"
	"github.com/t-tomalak/logrus-easy-formatter"
	"net/http"
	"os"
	"os/exec"
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

	templmanager.SetTemplateConfig("templates/layout/", "templates/", "templates/errors/")
	err = templmanager.LoadTemplates()
	if err != nil {
		log.Fatal(err)
	}

	r := routers.NewRouter()
	http.Handle("/", r)

	c := cron.New()
	_, err = c.AddFunc("@every 10m", func() { // FIX time in production
		if err := exec.Command("venv/bin/python", "pyscripts/recommendation.py").Run(); err != nil {
			log.Error(err)
		}

		if err := utils.DB.Exec("UPDATE books SET rating = r.avg_rating FROM (SELECT book_id, ROUND(AVG(rating), 2) AS avg_rating FROM ratings GROUP BY book_id) AS r WHERE id = r.book_id").Error; err != nil {
			log.Error(err)
		}

		log.Info("Recommendations recalculated")
	})
	if err != nil {
		log.Error(err)
	}
	c.Start()

	log.Info("Start listening on port: " + port)
	if err := http.ListenAndServe(":"+port, nil); err != nil {
		log.Fatal(err)
	}
}
