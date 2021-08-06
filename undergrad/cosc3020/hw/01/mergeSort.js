// HW 01 - COSC 3020 - Fall 2019
// Jacob Tuttle
// code for question 4. Sorting - Merge Sort

// This pseudo-code was for planning. I include it as a reference I used throughout
// debugging and since it was such a help, I can't find it in myself to delete it

// split the array by designating each segment
// merge elements of the segment into one piece
// work left to right, comparing two segments
//      if left is smaller just move on
//      if right is smaller, insert it into the "sorted" "segment" and move the halfway point
// work through all partitions of that size
// change the partition size to double
// go to top - loop until partition size is the size of the array

function mergeSort(arr) {

    // do the divide part of the mergesort
    for (var partSize = 2; partSize < 2 * arr.length; partSize *= 2) {
        // iterate through the partitions
        for (var partBottom = 0; partBottom < arr.length; partBottom += partSize) {
            // calculate the bounds of related partition edges
            // partHalf being the split between the two
            // partTop being the end of the partition
            var partHalf = partBottom + partSize / 2;

            // check array bounds
            if (partBottom + partSize - 1 > arr.length - 1) {
                // don't overflow the array, so use the max element instead for partTop
                partTop = arr.length - 1;
            } else {
                // since it won't overflow use the full partition size
                partTop = partBottom + partSize - 1;
            }

            // merge things if the partitions have elements
            if (partHalf - 1 < partTop) {
                arr = merge(arr, partBottom, partHalf, partTop);
            }
        }
    }
    return arr;
}

// function for merging two "partitions" denoted by [bottom, half] and [half, top]
function merge(array, a, b, c) {
    var bottom = a;
    var half = b;
    var top = c;

    // while everything hasn't been merged
    while (bottom <= half && half <= top) {
        // check if the smaller value is in the left "partition"
        if (array[bottom] <= array[half]) {
            bottom++;
        // if not, insert it into the lower half of the array and move shift the midpoint accordingly
        } else {
            array = insert(array, half, bottom);
            half++;
        }
    }

    return array;
}

// insert the value at location `ins` into array arr at position `tar`
function insert(arr, ins, tar) {
    var tmp = arr[ins];
    arr.splice(ins, 1);
    arr.splice(tar, 0, tmp);
    return arr;
}

// automated testing done using jsverify in mergeSortTest.js (what a clever name lol)
