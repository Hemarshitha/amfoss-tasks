package main
import ("fmt"; "strings")

func main() {
    var n int
    fmt.Print("Enter an odd number: ")
    fmt.Scan(&n)

    // Upper part
    for i := 0; i <= n/2; i++ {
        fmt.Println(strings.Repeat(" ", n/2-i) + strings.Repeat("*", 2*i+1))
    }

    // Lower part
    for i := n/2 - 1; i >= 0; i-- {
        fmt.Println(strings.Repeat(" ", n/2-i) + strings.Repeat("*", 2*i+1))
    }
}
