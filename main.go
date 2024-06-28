package main

import (
	"fmt"
	"net/http"
	"time"
)

func greet(w http.ResponseWriter, r *http.Request) {
	resp := r.PathValue("id")
	fmt.Fprintf(w, "Hello World! %s", time.Now())
}

func main() {
	http.HandleFunc("/post/{id}", greet)
	http.ListenAndServe(":8080", nil)
}
