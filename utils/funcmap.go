package utils

import "strings"

// ToUpper converts a string to uppercase.
func ToUpper(s string) string {
    return strings.ToUpper(s)
}

// ToLower converts a string to lowercase.
func ToLower(s string) string {
    return strings.ToLower(s)
}

// FuncMap returns a template.FuncMap with all utility functions.
func FuncMap() map[string]interface{} {
    return map[string]interface{}{
        "toUpper": ToUpper,
        "toLower": ToLower,
        // Add more functions as needed
    }
}
