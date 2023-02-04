package handlers

import (
	"net/http"

	"github.com/Uttkarsh-raj/employee/backendGO/employee"
)

func (e *Employees) PostEmployee(rw http.ResponseWriter, r *http.Request) {
	e.l.Println("Handle Post Request")
	empl := &employee.Employee{}
	err := empl.FromJSON(r.Body)
	if err != nil {
		http.Error(rw, "Unable to Unmarshall data", http.StatusBadRequest)
	}
	employee.AddProduc(empl)
}
