// handlers/user.go

package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func (h *Handler) UserHome(c *gin.Context) {

	// rows, err := h.DB.Query("SELECT ...")

	c.HTML(http.StatusOK, "user.html", gin.H{
		"Title": "User - Art Finder",
	})
}
