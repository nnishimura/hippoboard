package models

import (
  "os"
  "fmt"
  "github.com/jinzhu/gorm"
  _ "github.com/jinzhu/gorm/dialects/postgres"
)

var DB *gorm.DB

func ConnectDataBase() {
  dbHost := os.Getenv("DB_HOST")
  dbPort := os.Getenv("DB_PORT")
  dbUser := os.Getenv("DB_USER")
  dbName := os.Getenv("DB_NAME")
  dbPassword := os.Getenv("DB_PASSWORD")
  connection := fmt.Sprintf("host=%s port=%s user=%s dbname=%s password=%s sslmode=disable", dbHost, dbPort, dbUser, dbName, dbPassword)

  db, err := gorm.Open("postgres", connection)

  if err != nil {
    panic(err)
  }

  db.AutoMigrate(&Ticket{})

  DB = db
}
