package templmanager

import (
	"MetaLib/utils"
	"fmt"
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
func RenderTemplate(w http.ResponseWriter, name string, data interface{}) error {

	ctxData := struct {
		ClientID string
		Data     interface{}
	}{utils.GoogleClientId, data}

	tmpl, ok := templates[name]
	if !ok {
		return newTemplateManagerError(fmt.Sprintf("The template %s does not exist.", name))
	}

	err := tmpl.Execute(w, ctxData)
	if err != nil {
		return err
	}

	return nil
}
