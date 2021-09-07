package main

import (
	"fmt"

	"golang.org/x/crypto/blake2b"
)

func ok(err error) {
	if err != nil {
		panic(err)
	}
}

func main() {
	hash1 := []byte{0x01, 0x02, 0x03}

	_, err := blake2b.New(32, nil)
	ok(err)

	bstr1 := getBitString(blake2b.Sum512(hash1))
	hash1[2] = byte(setBit(int(hash1[2]), 3))
	bstr2 := getBitString(blake2b.Sum512(hash1))

	same, diff := cmpString(bstr1, bstr2)

	fmt.Printf("Total Changes:  %d\n", diff)
	fmt.Printf("Total Bits:     %d\n", diff+same)
	fmt.Printf("Percent Change: %f\n", float64(diff)/float64(diff+same)*100.0)
}

func getBitString(ns [64]byte) string {
	out := ""
	for _, n := range ns {
		out += fmt.Sprintf("%08b", n)
	}
	return out
}

func setBit(n int, pos uint) int {
	n |= (1 << pos)
	return n
}

func cmpString(s1, s2 string) (int, int) {
	same := 0
	diff := 0
	for i := 0; i < len(s1); i++ {
		if s1[i] == s2[i] {
			same++
		} else {
			diff++
		}
	}
	return same, diff
}
