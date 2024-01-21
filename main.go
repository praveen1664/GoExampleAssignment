// main.go

package main

import (
    "encoding/json"
    "fmt"
    "net/http"
    "time"
)

type DateRange struct {
    Start time.Time `json:"start"`
    End   time.Time `json:"end"`
}

type OverlapResponse struct {
    Overlap bool `json:"overlap"`
}

func checkOverlap(r1, r2 DateRange) bool {
    return r1.Start.Before(r2.End) && r2.Start.Before(r1.End)
}

func overlapHandler(w http.ResponseWriter, r *http.Request) {
    var input struct {
        Range1 DateRange `json:"range1"`
        Range2 DateRange `json:"range2"`
    }

    err := json.NewDecoder(r.Body).Decode(&input)
    if err != nil {
        http.Error(w, "Invalid JSON format", http.StatusBadRequest)
        return
    }

    overlap := checkOverlap(input.Range1, input.Range2)

    response := OverlapResponse{
        Overlap: overlap,
    }

    w.Header().Set("Content-Type", "application/json")
    err = json.NewEncoder(w).Encode(response)
    if err != nil {
        http.Error(w, "Error encoding JSON response", http.StatusInternalServerError)
        return
    }
}

func main() {
    http.HandleFunc("/overlap", overlapHandler)

    fmt.Println("Server listening on :8080")
    err := http.ListenAndServe(":8080", nil)
    if err != nil {
        fmt.Println("Error starting server:", err)
    }
}