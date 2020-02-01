package main

import (
	"MetaLib/models"
	"MetaLib/routers"
	"MetaLib/templmanager"
	"MetaLib/utils"
	"encoding/gob"
	"github.com/mymmrac/logrus-formatter"
	"github.com/robfig/cron/v3"
	log "github.com/sirupsen/logrus"
	"net/http"
	"os"
	"os/exec"
)

func init() {
	log.SetFormatter(&LogrusFormatter.Formatter{
		TimestampFormat: "2006-01-02 15:04:05",
		LogFormat:       "[%lvl%]: %time% %file%:%line% %func% - %msg%\n",
	})

	log.SetReportCaller(true)

	gob.Register(&models.User{})
}

func main() {
	var err error
	port := os.Getenv("PORT")

	err = utils.InitDb()
	if err != nil {
		log.Fatal(err)
	}

	utils.InitGoogle()

	templmanager.SetTemplateConfig("templates/layout/", "templates/", "templates/errors/")
	err = templmanager.LoadTemplates()
	if err != nil {
		log.Fatal(err)
	}

	r := routers.NewRouter()
	http.Handle("/", r)

	c := cron.New()
	_, err = c.AddFunc("@every 1h", func() {
		if err := utils.DB.Exec("UPDATE books SET rating = r.avg_rating FROM (SELECT book_id, ROUND(AVG(rating), 1) AS avg_rating FROM ratings GROUP BY book_id) AS r WHERE id = r.book_id").Error; err != nil {
			log.Error(err)
		}

		if err := exec.Command("/usr/bin/python3.6", "pyscripts/recommendation.py").Run(); err != nil {
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
