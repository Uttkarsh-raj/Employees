package handlers

import (
	"net/http"
	"strconv"

	"github.com/Uttkarsh-raj/employee/backendGO/employee"
	"github.com/gorilla/mux"
)

func (e *Employees) DeleteEmployee(rw http.ResponseWriter, r *http.Request) {
	e.l.Println("Handle DELETE Request")
	vars := mux.Vars(r)
	v, err := strconv.Atoi(vars["id"])
	if err != nil {
		http.Error(rw, "Data marshalling error", http.StatusBadRequest)
	}
	rw.Header().Set("Content-Type", "application/json")
	for index, empl := range employee.EmployeeList {
		if empl.ID == v {
			employee.EmployeeList = append(employee.EmployeeList[:index], employee.EmployeeList[index+1:]...)
			return
		}
	}
}
