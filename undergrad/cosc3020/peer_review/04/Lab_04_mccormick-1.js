//Chance McCormick
//Lab_04
//COSC 3020
//10/2/2019
'use strict'

permutation([1, 2, 3], 3, 0);   // test function
//var counter = 0;

function permutation(a, size, count)   //find all possible permutations of an array
{
    var sorted = false;
    //Code based on Heap's Algorithm

    if (size === 1) {              //if the size of array is 1 no need to go through all of the permutations
        //console.log(a);
        //console.log('count is ' + count);
        //console.log('counter is ' + counter);

        return a;
    }

    console.log(a);

    for (var i = 0; i < size; i++) {
        if (isSorted(a,count)==false) {
            count++;
        }
        permutation(a, size-1, count);  //recursively generates permutaions with last element left unchanged

        //count++;
        if (size % 2 == 0)  {        // if size of array is even
            var temp = a[i];        //Swap the element at index i and the last element
            a[i]=a[size-1];
            a[size-1]=temp;
            //count++;
        } else {
            var temp = a[0];        //if size of array is odd
            a[0] = a[size-1];       //Swap first and last element
            a[size-1] = temp;
            //count++;
        }
    }
    return count;
}

function isSorted(a, count) {
    for (var j=1; j<a.length; j++) {
        if (a[j-1] > a[j]) {
            //console.log("Not Sorted.");
            //console.log(a);
            //count++;
            return false;
        }
    }
    //console.log("Sorted Array Found");
    //console.log("Number of permutation " + count);   //count does NOT work correctly.  I couldnt get it to work.
    //console.log(a);
    return true;
}


function test() {
    var count =0;
    var Array1 = [6,5,4,3];
    permutation(Array1, Array1.length, count);
    var Array2 = [0, 42 ,8];
    permutation(Array2, Array2.length, count);
    var Array3 = [1,2];
    permutation(Array3, Array3.length, count);
    var Array4 = [0];
    permutation(Array4, Array4.length, count);

}
