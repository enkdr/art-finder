package main

import (
	"art-finder/routes"
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

	router.Use(sessions.Sessions("jwtToken", store))

	router.LoadHTMLGlob("templates/*.tmpl")
	routes.RegisterRoutes(router)

	router.Run(":8080")

}
