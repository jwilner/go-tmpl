package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("ok")

	os.Open("foobar")
}
