// handlers/user.go

package handlers

import (
    "net/http"

    "github.com/gin-gonic/gin"
)

func (h *Handler) UserHome(c *gin.Context) {
    // Example of using the database connection, replace this with actual queries
    // rows, err := h.DB.Query("SELECT ...")
    // Handle rows and err as needed

    c.HTML(http.StatusOK, "user.tmpl", gin.H{
        "Title": "User - Art Finder",
    })
}
