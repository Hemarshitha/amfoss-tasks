package main

import (
    "fmt"
    "io/ioutil"
    "strconv"
    "strings"
)

func main() {
    data, _ := ioutil.ReadFile("input.txt")
    n, _ := strconv.Atoi(strings.TrimSpace(string(data)))

    var output strings.Builder
    for i := 0; i <= n/2; i++ {
        output.WriteString(strings.Repeat(" ", n/2-i) + strings.Repeat("*", 2*i+1) + "\n")
    }
    for i := n/2 - 1; i >= 0; i-- {
        output.WriteString(strings.Repeat(" ", n/2-i) + strings.Repeat("*", 2*i+1) + "\n")
    }
    ioutil.WriteFile("output.txt", []byte(output.String()), 0644)
}
