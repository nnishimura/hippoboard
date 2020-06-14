package models

import (
  "os"
  "github.com/jinzhu/gorm"
  _ "github.com/jinzhu/gorm/dialects/postgres"
)

var DB *gorm.DB

func ConnectDataBase() {
  dbName := os.Getenv("DB_NAME")
  dbHost := os.Getenv("DB_HOST")
  dbUser := os.Getenv("DB_USER")
  dbPassword := os.Getenv("DB_PASSWORD")
  dbPort := os.Getenv("DB_PORT")

  db, err := gorm.Open("postgres", "host={{ dbHost }} port={{ dbPort }} user={{ dbUser }} dbname={{ dbName }} password={{ dbPassword }}")

  if err != nil {
    panic("Failed to connect to database!")
  }

  database.AutoMigrate(&Task{})

  DB = database
}
