import (
  "github.com/gin-gonic/gin"
  "github.com/nnishimura/hippoboard/api/app/models"
)

func FindTickets(c *gin.Context) {
  var tickets []models.Ticket
  models.DB.Find(&tickets)

  c.JSON(http.StatusOK, gin.H{"data": tickets})
}
