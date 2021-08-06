// lab 09 - COSC 3020 - Fall 2019
// Jacob Tuttle
// answers to written portions of the assignment included at the bottom of this file

// 1. Tail Recursion
// driver for tail recursive fibonacci
function fibonacciTail(n) { return fibTail(n - 1, 1, 0); }

// fibTail does the actual calculations for a fib number
function fibTail(n, acc, last) {
    if (n == 0)
        return acc;
    else
        return fibTail(n - 1, acc + last, acc);
}


// Testing

// main test driver program
// verb is a bool that denotes whether testing yields verbose output
function testMain(verb) {

    var f = fibonacciTail;

    // print out verbose testing
    if (verb) {
        console.log("\nVerbose Testing: ");
        console.log("-----------------");
        console.log("\nData:");
        console.log(3);
        console.log("Expected Return Value:");
        console.log(2);
        console.log("Return Value:");
        console.log(f(3));
        console.log("\nData:");
        console.log(5);
        console.log("Expected Return Value:");
        console.log(5);
        console.log("Return Value:");
        console.log(f(5));
        console.log("\nData:");
        console.log(7);
        console.log("Expected Return Value:");
        console.log(13);
        console.log("Return Value:");
        console.log(f(7));
    }

    // print out non-verbose testing
    if (f(3) == 2 && f(5) == 5 && f(7) == 13 && autoTest()) {
        console.log("\n\nAll tests passed.");
    } else {
        console.log("\n\nTesting failed. Run verbose to see where.");
    }

}

// run automated testing using the code provided in lecture as a baseline
function autoTest() {

    // variables about how many tests
    var maxFib = 1000
    var tests = 10000

    for (var i = 0; i < tests; i++) {
        var randomNum = Math.floor(Math.random() * maxFib + 1)
        if (fib_dp(randomNum) != fibonacciTail(randomNum)) {
            return false;
        }
    }
    return true;
}

// fibonacci code from lecture, used here to do automated testing
function fib_dp(n) {
    var fib_old = 1; var fib = 1;
    var fib_new;
    while(n > 2) {
        fib_new = fib + fib_old; fib_old = fib;
        fib = fib_new;
        --n;
    }
    return fib;
}

// check for verbose output and begin testing
// if not using node.js, you can disable this section and simply call testMain(false) to run all tests silently
if (process.argv.length == 3) {
    if (process.argv[2] == 'true') {
        testMain(true);
    } else {
        testMain(false);
    }
} else {
    console.log("To see more verbose settings, pass true as a command line argument:\n`node lab_07_tuttle.js true`");
    console.log("To avoid seeing this message again, pass false as a command line argument instead.");
    testMain(false);
}

// 2. Analysis
/*
    Yes, the time comlexity is less than that for recursive fibonacci. Instead of requiring nearly every number
    to be computed multiple times (as would be the case with a recursive implementation of the algorithm), this
    action accumulates values from the bottom up instead of top down. As a result, the tail recursive version will
    have a much smaller asymptotic complexity.
*/
