package main

import (
	"fmt"
	"net/http"
)

func greet(w http.ResponseWriter, r *http.Request) {
	resp := r.PathValue("id")
	fmt.Fprintf(w, "Hello World! %s", resp)
}

func main() {
	http.HandleFunc("/post/{id}", greet)
	http.ListenAndServe(":8080", nil)
}
