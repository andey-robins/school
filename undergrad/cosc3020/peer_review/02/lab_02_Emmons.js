// Stefan Emmons
// COSC-3020-01
// Lab 02
// 9-18-2019
// PART 1, Code:

function fib(n) { 
    if (n <= 2) {
        // For the purposes of returning an array, I provide a pre-built array if n = 1, or n = 2
        // If n = 1, I slice the 0 index of my array, and return that element.
        // If n = 2, return the whole array. Just like that,
        // the first two sequences of the Fibonacci series have been dealt with.
        return [1, 1].slice(0, n);
    }
    // Set up a constant value that serves as the "finshed product"(array in our case)
    // that will be returned once the recursive tree has ended
    const result = fib(n - 1);
    // Each time the recursive sequence has computed a new value, it is appended 
    // to the end of the "result" array.
    result.push(result[result.length - 1] + result[result.length - 2]);
    return result;
}

// Below is a simple test function that analyzes both length, and individual elements of the
// Fibonacci function return array, with a pre-built array. It is a simple way to insure 
// proper execution when not considering property-based testing. 
// Why test this way? A human built array is guaranteed to be correct (hopefully),
// a randomly generated array is still subject to errors native to the users machine.  

function testFib(fibArr1, testArr1) {
    if(fibArr1.length !== testArr1.length) {
        return "Array sizes do not match, no more testing will commence.";
    }
    for(var i = 0; i < fibArr1.length; i++)
    {
        if(fibArr1[i] !== testArr1[i]) {
            return "Elements do not match, test failed, check fib function.";
        }
    }
    return "Elements match, test has passed!";
}

console.log(testFib(fib(9), [1, 1, 2, 3, 5, 8, 13, 21, 34]));
console.log(testFib(fib(11), [2, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]));
console.log(testFib(fib(1), [1]));
console.log(testFib(fib(3), [1, 1, 1]));

// PART 2, Invariant:
// Begin with base case n = 1. We know that when n = 1, r (which is the result from the recursive sequence)
// will also equal 1. This is always true, because there is nothing to sum, and the function never actually recurses.
// Building upon this, our invariant: the elements in fib(1..n - 2 + n - 1) are always the sum of the previous two elements. 
// In terms of time complexity:
// Best case =>  O(n), return time is linear
// Average and worst case => O(2^n) Each function calls itself twice until the nth value has been fulfilled.  