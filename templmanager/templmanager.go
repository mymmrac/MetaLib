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
	TemplateIncludePath string
	TemplateLayoutPath  string
}

var config *templateConfig

// Set template configs
func SetTemplateConfig(includePath, layoutPath string) {
	config = &templateConfig{includePath, layoutPath}
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

	includeFiles, err := filepath.Glob(config.TemplateIncludePath + "*.html")
	if err != nil {
		return err
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
	session := utils.GetSession(r)

	user, err := models.GetUser(session)
	if err != nil {
		log.Error(err)
		user = &models.User{}
	}

	ctxData := struct {
		GoogleClientID string
		User           *models.User
		Data           interface{}
	}{utils.GoogleClientId, user, data}

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
