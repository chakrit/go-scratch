package main

import "fmt"
import "github.com/gorilla/mux"

func main() {
	fmt.Printf("Hello")

	// testing that imports actually works
	x := mux.NewRouter()
	_ = x
}
