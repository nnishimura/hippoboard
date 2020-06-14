package main

import (
    "github.com/nnishimura/hippoboard/api/app/models"
    "github.com/gin-gonic/gin"
    _ "github.com/joho/godotenv/autoload"
)

func main() {
    router := gin.Default()

    models.ConnectDatabase()

    router.GET("/ping", func(c *gin.Context) {
        c.JSON(200, gin.H{
            "message": "pong",
        })
    })

    router.GET("/tickets", controllers.FindTickets)

    // reverse proxy for nginx
    router.Run(":9000")
}
