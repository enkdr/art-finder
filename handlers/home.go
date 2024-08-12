package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func (h *Handler) Home(c *gin.Context) {
	c.HTML(http.StatusOK, "home.tmpl", gin.H{
		"Title": "Home - Art Finder",
	})
}
