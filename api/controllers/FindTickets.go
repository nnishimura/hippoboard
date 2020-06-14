package controllers

import (
  "net/http"
  "github.com/gin-gonic/gin"
  "hippoboard/models"
)

func FindTickets(c *gin.Context) {
  var tickets []models.Ticket
  models.DB.Find(&tickets)

  c.JSON(http.StatusOK, gin.H{"data": tickets})
}
