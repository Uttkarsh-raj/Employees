package handlers

import (
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/Uttkarsh-raj/employee/backendGO/employee"
	"github.com/gorilla/mux"
)

func (e *Employees) UpdateHandler(rw http.ResponseWriter, r *http.Request) {
	e.l.Println("Handle Update Request")
	vars := mux.Vars(r)
	v, err := strconv.Atoi(vars["id"])
	if err != nil {
		http.Error(rw, "Data marshalling error", http.StatusBadRequest)
	}
	rw.Header().Set("Content-Type", "application/json")
	for index, empl := range employee.EmployeeList {
		if empl.ID == v {
			employee.EmployeeList = append(employee.EmployeeList[:index], employee.EmployeeList[index+1:]...)
			var e *employee.Employee
			_ = json.NewDecoder(r.Body).Decode(&e)
			e.ID = v
			employee.EmployeeList = append(employee.EmployeeList, e)
			json.NewEncoder(rw).Encode(e)
			return
		}
	}
}
