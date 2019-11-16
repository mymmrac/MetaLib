package utils

import (
	log "github.com/sirupsen/logrus"
	"net/http"
	"strconv"
)

func ParseForm(r *http.Request) error {
	if err := r.ParseForm(); err != nil {
		return err
	}
	return nil
}

func FormGetInt(r *http.Request, key string) (int, bool) {
	valueStr := r.PostFormValue(key)
	if len(valueStr) == 0 {
		return 0, false
	}

	value, err := strconv.Atoi(valueStr)
	if err != nil {
		log.Error(err)
		return 0, false
	}

	return value, true
}

func FormGetUint(r *http.Request, key string) (uint, bool) {
	valueStr := r.PostFormValue(key)
	if len(valueStr) == 0 {
		return 0, false
	}

	value, err := strconv.ParseUint(valueStr, 10, 64)
	if err != nil {
		log.Error(err)
		return 0, false
	}

	return uint(value), true
}

func FormGetStr(r *http.Request, key string) (string, bool) {
	value := r.PostFormValue(key)
	if len(value) == 0 {
		return "", false
	}

	return value, true
}
