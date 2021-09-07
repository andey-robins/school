package main

import (
	"crypto/sha256"
	"fmt"
	"os"
)

func ok(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	fname := os.Args[1]
	hash := os.Args[2]

	// open up the file for hashing
	file, err := os.Open(fname)
	ok(err)
	defer file.Close()

	fileInfo, err := file.Stat()
	ok(err)

	buff := make([]byte, fileInfo.Size())

	_, err = file.Read(buff)
	ok(err)

	// hash and output the file hash
	switch hash {
	case "sha256":
		hash := sha256.Sum256(buff)
		fmt.Printf("%x\n", hash)
	}
}
