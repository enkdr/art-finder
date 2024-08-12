package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func UserHome(c *gin.Context) {
	c.HTML(http.StatusOK, "user.tmpl", gin.H{
		"Title": "User - Art Finder",
	})

}
