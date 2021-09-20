package hashtable

import (
	"crypto/sha256"
	"encoding/binary"
	"errors"
	"math"
)

type Hashtable struct {
	table       []tableRow
	truncLength int
}

type tableRow struct {
	row []tableElement
}

type tableElement struct {
	key   string
	value int
}

func New(size int) *Hashtable {
	ceil := []int{8, 16, 32, 64}

	// find the smallest power of two range that nicely fits
	// the requested size
	for _, val := range ceil {
		if int(math.Pow(2, float64(val))) > size {
			h := &Hashtable{}
			h.truncLength = val
			h.table = make([]tableRow, int(math.Pow(2, float64(val))))
			return h
		}
	}

	// default should only happen if we try to create a hashtable with size
	// greater than uint64 max size. in that case, default to uint64 size
	h := &Hashtable{}
	h.table = make([]tableRow, int(math.Pow(2, 64.0)))
	h.truncLength = 64
	return h
}

// Insert inserts a new key/value pair into the hashtable.
// Should return an error if the key already exists.
func (h *Hashtable) Insert(key string, value int) error {
	addr := getHashedKey(key, h.truncLength)
	if len(h.table[addr].row) != 0 {
		h.table[addr].row = append(h.table[addr].row, tableElement{key, value})
		return nil
	}
	h.table[addr].row = append(make([]tableElement, 0), tableElement{key, value})
	return nil
}

// Update updates an existing key to be associated with a different value.
// Should return an error if the key doesn't already exist.
func (h *Hashtable) Update(key string, value int) error {
	addr := getHashedKey(key, h.truncLength)
	if !keyExists(&h.table[addr], key) {
		return errors.New("key does not exist")
	}
	updateKey(key, value, &h.table[addr])
	return nil
}

// Delete deletes a key/value pair from the hashtable.
// Should return an error if the given key doesn't exist.
func (h *Hashtable) Delete(key string) error {
	addr := getHashedKey(key, h.truncLength)
	if !keyExists(&h.table[addr], key) {
		return errors.New("key does not exist")
	}
	removeKey(key, &h.table[addr])
	return nil
}

// Exists returns true if the key exists in the hashtable, false otherwise.
func (h *Hashtable) Exists(key string) bool {
	addr := getHashedKey(key, h.truncLength)
	return keyExists(&h.table[addr], key)
}

// Get returns the value associated with the given key.
// Should return an error if value doesn't exist.
func (h *Hashtable) Get(key string) (int, error) {
	addr := getHashedKey(key, h.truncLength)
	if v, err := getKey(key, &h.table[addr]); err != nil {
		return 0, err
	} else {
		return v, nil
	}
}

// generate the hashed key and parse it based on the current size of
// the hash table
func getHashedKey(key string, len int) int {
	hash := sha256.Sum256([]byte(key))
	switch len {
	case 8:
		return int(hash[0])
	case 16:
		return int(binary.BigEndian.Uint16(hash[0:2]))
	case 32:
		return int(binary.BigEndian.Uint32(hash[0:4]))
	default:
		return int(binary.BigEndian.Uint64(hash[0:8]))
	}
}

// returns true if the key exists and false otherwise
func keyExists(r *tableRow, key string) bool {
	for _, e := range r.row {
		if e.key == key {
			return true
		}
	}
	return false
}

// returns the value of a key if the key is present
// and a "key does not exist" error if the key isn't there
func getKey(key string, r *tableRow) (int, error) {
	for _, e := range r.row {
		if e.key == key {
			return e.value, nil
		}
	}

	return 0, errors.New("key does not exist")
}

// updates the value of a key if it exists and does nothing if
// it doesn't exist
func updateKey(key string, value int, r *tableRow) {
	for _, e := range r.row {
		if e.key == key {
			e.value = value
		}
	}
}

// check a slice for a key, if it is present, remove it from the slice
func removeKey(key string, r *tableRow) {
	index := 0

	for i, e := range r.row {
		if e.key == key {
			index = i
		}
	}

	r.row = append(r.row[:index], r.row[index+1:]...)
}
