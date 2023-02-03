package employee

import (
	"encoding/json"
	"io"
)

type Employee struct {
	ID       int    `json:"id"`
	Name     string `json:"name"`
	Salary   string `json:"salary"`
	Location string `json:"location"`
}

type Employees []*Employee

func GetEmployees() Employees {
	return employeeList
}

// DEMO Values
var employeeList = []*Employee{
	&Employee{
		ID:       1,
		Name:     "John",
		Salary:   "$1500",
		Location: "Lomdon",
	},
	&Employee{
		ID:       2,
		Name:     "Annya",
		Salary:   "$1500",
		Location: "England",
	},
}

func (e *Employee) FromJSON(r io.Reader) error {
	err := json.NewDecoder(r)
	return err.Decode(e)
}

func (e *Employees) ToJSON(w io.Writer) error {
	err := json.NewEncoder(w)
	return err.Encode(e)
}
