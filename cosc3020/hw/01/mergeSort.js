// HW 01 - COSC 3020 - Fall 2019
// Jacob Tuttle
// code for question 4. Sorting - Merge Sort
function sort(originalArray) {
    const array = [...originalArray];
    const n = array.length;

    // outer loop: number of elements to merge`
    for(let j = 2; j < 2 * n; j *= 2) {
        // inner loop: merge chunks of size j
        for(let i = 0; i < n; i += j) {
            let right = Math.min(i + j - 1, n - 1);
            // mid is the last index of the sorted first part
            let mid = i + j/2 - 1;
            if(mid < right) merge(array, i, mid, right);
            console.log(array);
        }
    }
    return array;
}

function merge(array, lo, mid, hi) {
    let a = lo, b = mid + 1, tmp;
    while(a <= mid && b <= hi) {
        if(array[a] <= array[b]) {
            a++;
        } else {
            tmp = array[a];
            array[a++] = array[b++];
            for(let i = a; i < b; i++) {
                let tmptmp = array[i];
                array[i] = tmp;
                tmp = tmptmp;
            }
            mid++;
        }
    }
}

console.log(sort([1, 6, 8, 2, 5, 3, 7, 4]));
