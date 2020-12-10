//Shan Li(08428037)
// COSC 3020
// Assignment 1, Question 4

// help from Thomas



// Generates a random array 10 - 19 elements long with
// values from 0 - 99.
var a = Array(Math.floor(Math.random() * 10) + 10)
for (var i = 0; i < a.length; i++) {
    a[i] = Math.floor(Math.random() * 100);
}

// Displays the array, sorts it,
// then displays it again.
console.log("Unsorted List:");
console.log(a);
mergeSort(a);
console.log("Sorted List:");
console.log(a);

// Checks to see if the list is really sorted.
// Makes testing easier.
var sorted = true;
for (var i = 0; i < a.length - 2; i++) {
    if (a[i] > a[i + 1]) {
        sorted = false;
    }
}
console.log("Sorted Correctly: " + sorted);

function mergeSort(a) {
    var lo;
    var hi;

    // Outer loop determines size of the parts
    // being merged.
    for (var i = 2; i < 2 * a.length; i *= 2) {
        // Inner loop determines where the two parts
        // being merged begin in the array.
        for (lo = 0; lo < a.length; lo += i) {
            hi = lo + (i - 1);
            merge(a, lo, hi);
        }

    }
}

function merge(a, lo, hi) {
    // Splits the section given into two
    // smaller sections to be merged.
    var mid = Math.floor((lo + hi) / 2);

    // Merges the two sections in place.
    // Kind of similar to insertion sort.
    var iterator1 = lo;
    var iterator2 = mid + 1;
    while (iterator1 <= mid
        && iterator1 < a.length
        && iterator2 <= hi
        && iterator2 < a.length) {
        if (a[iterator2] < a[iterator1]) {
            var val = a[iterator2];
            for (var i = iterator2; i > iterator1; i--) {
                a[i] = a[i - 1];
            }
            a[iterator1] = val;
            iterator1++;
            iterator2++;
            mid++;
        }
        else {
            iterator1++;
        }
    }





    // This was the first attempt, although it wasn't
    // in place, so it had to be redone.


    // Merges the two smaller sections until
    // at least one is out of elements.
    /*while (iterator1 <= mid
        && iterator1 < a.length
        && iterator2 <= hi
        && iterator2 < a.length) {

        if (a[iterator1] <= a[iterator2]) {
            tmp.push(a[iterator1]);
            iterator1++;
        }
        else {
            tmp.push(a[iterator2]);
            iterator2++;
        }
    }

    // Only one of these two loops will execute. The one
    // that does will finish filling in tmp with the remainder
    // of the elements from the list that isn't empty.
    while (iterator1 <= mid && iterator1 < a.length) {
        tmp.push(a[iterator1]);
        iterator1++;
    }

    while (iterator2 <= hi && iterator2 < a.length) {
        tmp.push(a[iterator2]);
        iterator2++;
    }

    for (var i = 0; i < tmp.length; i++) {
        a[lo + i] = tmp[i];
    }
    */
}