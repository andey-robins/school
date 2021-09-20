package main

import (
	"log"
	"net/http"

	auth "github.com/andey-robins/login-service-andey-robins/server/auth"
)

func main() {
	http.HandleFunc("/register", auth.Register)
	http.HandleFunc("/login", auth.Login)

	log.Fatalln(http.ListenAndServe(":8080", nil))
}
