// 1. The above program to compute the sum of a list is incorrect. Why?
/*
    The sum inizializes with the value of the first element in the array
    and then adds it during the next iteration.
*/

function sum(a) {

    var sum = 0;
    for (var i = 0; i < a.length; i++) {
        sum += a[i];
    }
    return sum;
}


// 2. What does the above program do?
/*
    This function recursively finds the greatest value in an array `a`
*/

// 3. Binary Search

function binarySearch(list, element) {

    var mid = Math.floor(list.length / 2);

    if (list.length === 0) {
        return -1;
    }

    if (list[mid] === element) {
        return mid;
    } else if (list[mid] < element) {
        var half = binarySearch(list.slice(0, mid), element);
    } else {
        var half = binarySearch(list.slice(mid, list.length), element);
    }

    return half;
}
