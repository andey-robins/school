// assignment 03 - COSC 3020 - Fall 2019
// Jacob Tuttle
//
// a file that runs automated testing on the held-karp.js and stochastic.js files and the
// algorithms contained within. this file also performs automated testing for the purpose
// of comparing the two algorithms.

// import relevant project files
const heldkarp = require('./held-karp.js');
const stochastic = require('./stochastic.js');
const Graph = require('./graph.js');


var testGraph = new Graph([[1, 2], [2, 1]]);
console.log(testGraph);

//
// main functions for experiments
//

// run tests for the time for heldkarp
function mainHeldKarpTest() {

}

// run tests for the time for stochastic local search
function mainStochasticTest() {

}

//
// utility functions
//

// return a random adjacency matrix of size n by n
function adjMatrixGenerator(n, MAX_DISTANCE) {
    matrix = [];
    for (var i = 0; i < n; i ++) {
        row = [];
        for (var j = 0; j < n; j++) {
            row.push(Math.floor(Math.random() * MAX_DISTANCE) + 1);
        }
        matrix.push(row);
    }
    return matrix;
}

// testing functions for individual parts
function testHeldKarp(verb) {

    var f = heldkarp.tsp_hk;
    var u = 10000000;

    // a set of test inputs and their expected outputs
    gLinear = [ [u, 2, u], [u, u, 2], [u, u, u] ];
    dLinear = 4;
    gNotAllConnected = [ [u, 1, 2, 5], [1, u, 1, 1], [1, 1, u, 2], [1, 1, 1, u] ];
    dNotAllConnected = 3;
    gNotIdentity = [ [u, 1, 1, 1], [1, u, 1, 1], [1, 1, u, 1], [1, 1, 1, u] ];
    dNotIdentity = 3;
    gTwoPath = [ [u, 2, 4], [1, u, 4], [1, 3, u] ];
    dTwoPath = 6;

    // print out verbose testing

    if (verb) {
        console.log("\nVerbose Testing: ");
        console.log("-----------------");

        console.log("\nData:");
        console.log(gLinear);
        console.log("Expected Return Value:");
        console.log(dLinear);
        console.log("Return Value:");
        console.log(f(gLinear));
        console.log("\nData:");
        console.log(gTwoPath);
        console.log("Expected Return Value:");
        console.log(dTwoPath);
        console.log("Return Value:");
        console.log(f(gTwoPath));
        console.log("\nData:");
        console.log(gNotAllConnected);
        console.log("Expected Return Value:");
        console.log(dNotAllConnected);
        console.log("Return Value:");
        console.log(f(gNotAllConnected));
        console.log("\nData:");
        console.log(gNotIdentity);
        console.log("Expected Return Value:");
        console.log(dNotIdentity);
        console.log("Return Value:");
        console.log(f(gNotIdentity));
    }

    // print out non-verbose testing
    if (f(gLinear) == dLinear && f(gTwoPath) == dTwoPath && f(gNotAllConnected) == dNotAllConnected && f(gNotIdentity) == dNotIdentity) {
        console.log("\n\nAll tests passed.");
    } else {
        console.log("\n\nTesting failed. Run verbose to see where.");
    }

}

function testStochastic(verb) {

}

function testGraphs(verb) {

}

// check for command line arguments
// node testDriver.js [heldkarp, ]
if (process.argv.length == 4) {
    if (process.argv[2] == 'heldkarp') {
        if (process.argv[3] == 'true') {
            testHeldKarp(true);
        } else {
            testHeldKarp(false);
        }
    } else if (process.argv[2] == 'stochastic') {
        if (process.argv[3] == 'true') {
            testStochastic(true);
        } else {
            testStochastic(false);
        }
    } else if (process.argv[2] == 'graphs') {
        if (process.argv[3] == 'true') {
            testGraphs(true);
        } else {
            testGraphs(false);
        }
    }
} else if (process.argv.length == 3) {
    if (process.argv[2] == 'heldkarp') {
        testHeldKarp(false);
    } else if (process.argv[2] == 'stochastic') {
        testStochastic(false);
    } else if (process.argv[2] == 'graphs') {
        testGraphs(false);
    } else if (process.argv[2] == 'time-hk') {
        mainHeldKarpTest();
    } else if (process.argv[2] == 'time-sls') {
        mainStochasticTest();
    }
} else {
    console.log("Run `node testDriver.js help` to get help with arguments.");
}
