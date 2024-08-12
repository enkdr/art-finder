package main

import (
	"art-finder/config"
	"art-finder/database"
	"art-finder/routes"
	"log"
	"net/http"
	"os"

	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-gonic/gin"
)

var sessionKey = []byte(os.Getenv("SESSION_SECRET"))

func main() {
	router := gin.Default()
	store := cookie.NewStore(sessionKey)
	isDev := os.Getenv("GO_ENV") == "development"

	store.Options(sessions.Options{
		Path:     "/",
		MaxAge:   3600 * 24, // 1 day
		HttpOnly: true,
		Secure:   !isDev, // Secure flag is false in development mode
		SameSite: http.SameSiteLaxMode,
	})

	config, err := config.GetConfig()
	if err != nil {
		log.Fatalln("Failed to retrieve configs:", err)
	}

	db, err := database.InitDB(config)
	if err != nil {
		log.Fatalf("failed to initialize database: %v", err)
	}

	router.Use(sessions.Sessions("jwtToken", store))

	router.LoadHTMLGlob("templates/*.tmpl")
	routes.RegisterRoutes(router, db)

	router.Run(":8080")

}
