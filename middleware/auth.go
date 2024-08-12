package middleware

import (
	"art-finder/utils"
	"fmt"
	"net/http"
	"os"
	"strings"

	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

var jwtSecret = []byte(os.Getenv("JWT_SECRET"))

func JWTAuthRequired(c *gin.Context) {

	err := godotenv.Load()
	if err != nil {
		fmt.Println("Error loading .env file")
	}

	authHeader := c.GetHeader("Authorization")
	if authHeader == "" {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Authorization header is missing"})
		c.Abort()
		return
	}

	tokenString := strings.TrimSpace(strings.Replace(authHeader, "Bearer", "", 1))
	claims, err := utils.ValidateJWT(tokenString, jwtSecret)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid token"})
		c.Abort()
		return
	}

	c.Set("userID", claims["user_id"])
	c.Next()
}

func SessionAuthRequired(c *gin.Context) {
	session := sessions.Default(c)
	token := session.Get("jwtToken")

	if token == nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Authorization required"})
		c.Abort()
		return
	}

	claims, err := utils.ValidateJWT(token.(string), jwtSecret)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid token"})
		c.Abort()
		return
	}

	c.Set("userID", claims["user_id"])
	c.Next()
}
