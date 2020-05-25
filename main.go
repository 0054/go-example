package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func logging(f http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		log.Println(r.URL.Path + " - " + r.Method)
		f(w, r)
	}
}

func Hello(w http.ResponseWriter, r *http.Request) {
	hostname, err := os.Hostname()
	if err != nil {
		panic(err)
	}
	fmt.Fprintf(w, "hello world from "+hostname)
}

func main() {
	http.HandleFunc("/", logging(Hello))
	fmt.Println("listen on 0.0.0.0:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
