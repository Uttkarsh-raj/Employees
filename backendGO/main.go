package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/Uttkarsh-raj/employee/backendGO/handlers"
	"github.com/gorilla/mux"
	"github.com/nicholasjackson/env"
)

var bindAddress = env.String("BIND_ADDRESS", false, ":9090", "Bind address for the server")

func main() {
	env.Parse()
	l := log.New(os.Stdout, "employee-api ", log.LstdFlags)
	r := mux.NewRouter()

	//Getting all the values in the database(GET RQUEST)
	emp := handlers.NewEmployee(l)

	getRouter := r.Methods("GET").Subrouter()
	getRouter.HandleFunc("/", emp.GetEmployees)

	getIdRouter := r.Methods("GET").Subrouter()
	getIdRouter.HandleFunc("/{id}", emp.GetEmpById)

	postRouter := r.Methods("POST").Subrouter()
	postRouter.HandleFunc("/", emp.PostEmployee)

	deleteRouter := r.Methods("DELETE").Subrouter()
	deleteRouter.HandleFunc("/{id}", emp.DeleteEmployee)

	updateRouter := r.Methods("PUT").Subrouter()
	updateRouter.HandleFunc("/{id}", emp.UpdateHandler)

	//Creating and Running a "SERVER"
	fmt.Println("Server started at port 7070")
	log.Fatal(http.ListenAndServe(":7070", r))

}
