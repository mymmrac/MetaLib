package templmanager

import (
	"MetaLib/models"
	"MetaLib/utils"
	"fmt"
	log "github.com/sirupsen/logrus"
	"html/template"
	"net/http"
	"path/filepath"
)

var templates map[string]*template.Template

const mainTemplateString = `{{define "main" }} {{ template "base" . }} {{ end }}`

type templateConfig struct {
	TemplateLayoutPath   string
	TemplateIncludePaths []string
}

var config *templateConfig

// Set template configs
func SetTemplateConfig(layoutPath string, includePath ...string) {
	config = &templateConfig{TemplateLayoutPath: layoutPath, TemplateIncludePaths: includePath}
}

type templateManagerError struct {
	error string
}

func (e *templateManagerError) Error() string {
	return e.error
}

func newTemplateManagerError(error string) error {
	return &templateManagerError{error}
}

// Loads all template files
func LoadTemplates() (err error) {
	if config == nil {
		return newTemplateManagerError("No template configs detected")
	}

	if templates == nil {
		templates = make(map[string]*template.Template)
	}

	layoutFiles, err := filepath.Glob(config.TemplateLayoutPath + "*.html")
	if err != nil {
		return err
	}

	var includeFiles []string
	for _, path := range config.TemplateIncludePaths {
		include, err := filepath.Glob(path + "*.html")
		if err != nil {
			return err
		}
		includeFiles = append(includeFiles, include...)
	}

	mainTemplate := template.New("main")
	mainTemplate, err = mainTemplate.Parse(mainTemplateString)
	if err != nil {
		return err
	}
	for _, file := range includeFiles {
		fileName := filepath.Base(file)
		files := append(layoutFiles, file)
		templates[fileName], err = mainTemplate.Clone()
		if err != nil {
			return err
		}
		templates[fileName] = template.Must(templates[fileName].ParseFiles(files...))
	}

	return nil
}

// Renders template
func RenderTemplate(w http.ResponseWriter, r *http.Request, name string, data interface{}) error {
	session := utils.GetSession(r, w)

	user, err := models.GetUser(session)
	if err != nil {
		userErr, ok := err.(*models.UserError)
		if !ok {
			log.Fatal("Convert error to UserError failed")
		}
		if userErr.Code() != models.EmptySession {
			log.Error(err)
		}
		user = &models.User{}
	}

	var recommendedBooks []*models.Book
	if user.Status == models.Logged {
		recommendedBooks, err = user.GetRecommendations()
		if err != nil {
			log.Error(err)
		}
	}

	recommendsCount := 10

	if len(recommendedBooks) < recommendsCount {
		staelNeed := recommendsCount - len(recommendedBooks)
		var uId uint
		if user.Status == models.Logged {
			uId = user.Id
		} else {
			uId = 0
		}

		var rb []*models.Book
		utils.DB.Raw(`SELECT b.id, b.name, b.rating, b.cover
FROM (SELECT books.id, books.name, books.rating, books.cover
      FROM books
               LEFT JOIN ratings ON books.id = ratings.book_id AND ratings.user_id = ?
      WHERE ratings.book_id IS NULL) AS b
         LEFT JOIN user_tops ON b.id = user_tops.book_id AND user_tops.user_id = ?
WHERE user_tops.book_id IS NULL
ORDER BY b.rating DESC
LIMIT ?`, uId, uId, staelNeed).Scan(&rb)

		recommendedBooks = append(recommendedBooks, rb...)
	}

	ctxData := struct {
		GoogleClientID   string
		User             *models.User
		RecommendedBooks []*models.Book
		Data             interface{}
	}{GoogleClientID: utils.GoogleClientId, User: user, RecommendedBooks: recommendedBooks, Data: data}

	tmpl, ok := templates[name]
	if !ok {
		return newTemplateManagerError(fmt.Sprintf("The template %s does not exist.", name))
	}

	err = tmpl.Execute(w, ctxData)
	if err != nil {
		return err
	}

	return nil
}
