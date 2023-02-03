package handlers

import (
	"log"
	"net/http"

	"github.com/Uttkarsh-raj/employee/backendGO/employee"
)

type Employees struct {
	l *log.Logger
}

func NewEmployee(l *log.Logger) *Employees {
	return &Employees{l}
}

func (e *Employees) GetEmployees(rw http.ResponseWriter, r *http.Request) {
	e.l.Println("Handle Get Employees")
	lp := employee.GetEmployees()
	err := lp.ToJSON(rw)
	if err != nil {
		http.Error(rw, "Unable to Marshall data", http.StatusInternalServerError)
	}
}
