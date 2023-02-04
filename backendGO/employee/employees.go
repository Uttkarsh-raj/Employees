package employee

import (
	"encoding/json"
	"fmt"
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
	return EmployeeList
}

// DEMO Values
var EmployeeList = []*Employee{
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

func GetEmpById(id int, e *Employee) (error, *Employee) {
	_, pos, err := findProduct(id)
	if err != nil {
		return nil, nil
	}
	e.ID = id
	EmployeeList[pos] = e
	return nil, EmployeeList[pos]

}

var ErrProduxtNotFound = fmt.Errorf("Product not found")

func findProduct(id int) (*Employee, int, error) {
	for i, p := range EmployeeList {
		if p.ID == id {
			return p, i, nil
		}
	}
	return nil, -1, ErrProduxtNotFound
}

func AddProduc(p *Employee) {
	p.ID = getNextId()
	EmployeeList = append(EmployeeList, p)
}

func getNextId() int {
	lp := EmployeeList[len(EmployeeList)-1]
	return lp.ID + 1
}
