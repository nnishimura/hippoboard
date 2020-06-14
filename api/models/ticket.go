package models

import (
  "time"
)

type Ticket struct {
  ID     uint   `gorm:"primary_key"`
  Title  string `gorm:"not null"`
  Status string `gorm:"default:'todo';not null"`
  CreatedAt time.Time `gorm:"not null"`
  UpdatedAt time.Time
  DeletedAt time.Time
  DueAt time.Time
}
