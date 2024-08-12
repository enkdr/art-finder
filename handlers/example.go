package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func (h *Handler) Example(c *gin.Context) {
	c.HTML(http.StatusOK, "example.tmpl", gin.H{
		"Title": "Example - Art Finder",
	})
}
