package config

import (
	"errors"
	"os"

	_ "github.com/joho/godotenv/autoload"
)

type Config struct {
	PORT          int
	DB_PORT       string
	DB_HOST       string
	DB_USER       string
	DB_NAME       string
	DB_PASSWORD   string
	TEMPLATE_PATH string
}

func GetConfig() (Config, error) {

	config := Config{}

	envVars := map[string]*string{
		"DB_PORT":       &config.DB_PORT,
		"DB_HOST":       &config.DB_HOST,
		"DB_USER":       &config.DB_USER,
		"DB_NAME":       &config.DB_NAME,
		"DB_PASSWORD":   &config.DB_PASSWORD,
	}

		// loop through env(s)
	for key, value := range envVars {
		envValue := os.Getenv(key)
		if envValue == "" {
			return Config{}, errors.New(key + " is required")
		}
		*value = envValue
	}

	return config, nil
}
