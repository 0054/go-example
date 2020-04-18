package main

import (
	"fmt"
	"log"
	"net/http"
)

func logging(f http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		log.Println( r.URL.Path + " - " + r.Method + " - " + " STATUS CODE!!!")
		f(w, r)
	}
}

func Hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello world")
}

func main() {
	http.HandleFunc("/", logging(Hello))
	fmt.Println("listen on 0.0.0.0:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
