package utils

import (
	"github.com/sirupsen/logrus"
	"strconv"
	"strings"
)

const (
	defaultLogFormat       = "[%lvl%]: %time% - %msg%\n"
	defaultTimestampFormat = "2006-01-02 15:04:05"
)

type formatter struct {
	TimestampFormat string
	LogFormat       string
}

func (f *formatter) Format(entry *logrus.Entry) ([]byte, error) {
	output := f.LogFormat
	timestampFormat := f.TimestampFormat

	output = strings.Replace(output, "%time%", entry.Time.Format(timestampFormat), 1)

	output = strings.Replace(output, "%msg%", entry.Message, 1)

	level := strings.ToUpper(entry.Level.String())
	output = strings.Replace(output, "%lvl%", level, 1)

	for k, val := range entry.Data {
		switch v := val.(type) {
		case string:
			output = strings.Replace(output, "%"+k+"%", v, 1)
		case int:
			s := strconv.Itoa(v)
			output = strings.Replace(output, "%"+k+"%", s, 1)
		case bool:
			s := strconv.FormatBool(v)
			output = strings.Replace(output, "%"+k+"%", s, 1)
		}
	}

	return []byte(output), nil
}

func InitFormatter() {
	logrus.SetFormatter(&formatter{
		TimestampFormat: defaultTimestampFormat,
		LogFormat:       defaultLogFormat,
	})
}
