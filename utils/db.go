package utils

import (
	"database/sql"
	"fmt"
	_ "github.com/lib/pq"
	"os"
)

var DB *sql.DB

func InitDb() error {
	var err error
	connection := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=%s", os.Getenv("DB_HOST"), os.Getenv("DB_PORT"), os.Getenv("DB_USER"), os.Getenv("DB_PASS"), os.Getenv("DB_NAME"), os.Getenv("DB_SSLMODE"))
	DB, err = sql.Open("postgres", connection)
	if err != nil {
		return err
	} else {
		err = DB.Ping()
		if err != nil {
			return err
		} else {
			return nil
		}
	}
}
