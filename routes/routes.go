package routes

import (
	"art-finder/handlers"
	"art-finder/middleware"

	"github.com/gin-gonic/gin"
)

func RegisterRoutes(router *gin.Engine) {

	router.Static("/static", "./static")

	auth := router.Group("/auth")
	{
		auth.GET("/github", handlers.GitHubLogin)
		auth.GET("/github/callback", handlers.GitHubCallback)
		// auth.GET("/google", handlers.GoogleLogin)
		// auth.GET("/google/callback", handlers.GoogleCallback)
	}

	user := router.Group("/user")
	user.Use(middleware.SessionAuthRequired)
	{
		user.GET("/", handlers.UserHome)
	}

	router.GET("/", handlers.Home)
	router.GET("/example", handlers.Example)
}
