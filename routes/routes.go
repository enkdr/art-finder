package routes

import (
	"art-finder/handlers"
	"art-finder/middleware"

	"github.com/jmoiron/sqlx"

	"github.com/gin-gonic/gin"
)

func RegisterRoutes(router *gin.Engine, db *sqlx.DB) {

	router.Static("/static", "./static")

	// Create a handler instance with the database handle
	h := &handlers.Handler{DB: db}

	auth := router.Group("/auth")
	{
		auth.GET("/github", h.GitHubLogin)
		auth.GET("/github/callback", h.GitHubCallback)
		// auth.GET("/google", h.GoogleLogin)
		// auth.GET("/google/callback", h.GoogleCallback)
	}

	user := router.Group("/user")
	user.Use(middleware.SessionAuthRequired)
	{
		user.GET("/", h.UserHome)
	}

	router.GET("/", h.Home)
	router.GET("/example", h.Example)
}
