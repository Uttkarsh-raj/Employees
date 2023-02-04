package handlers

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/Uttkarsh-raj/employee/backendGO/employee"
	"github.com/gorilla/mux"
)

type Employee struct {
	l *log.Logger
}

var ErrProduxtNotFound = fmt.Errorf("Product not found")

func (e *Employees) GetEmpById(rw http.ResponseWriter, r *http.Request) {
	e.l.Println("Handle Get by ID Employees")
	vars := mux.Vars(r)
	v, err := strconv.Atoi(vars["id"])
	if err != nil {
		http.Error(rw, "Data marshalling error", http.StatusBadRequest)
	}
	rw.Header().Set("Content-Type", "application/json")
	for _, empl := range employee.EmployeeList {
		if empl.ID == v {
			json.NewEncoder(rw).Encode(empl)
			return
		}
	}
}
