package main

import (
  "fmt"
  "net/http"
)

func main() {
  port := "5555"

  http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
      fmt.Fprintf(w, "Localhost:"+port)
  })

  http.ListenAndServe(":"+port, nil)
}
