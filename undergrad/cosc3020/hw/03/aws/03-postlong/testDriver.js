// assignment 03 - COSC 3020 - Fall 2019
// Jacob Tuttle
//
// a file that runs automated testing on the held-karp.js and stochastic.js files and the
// algorithms contained within. this file also performs automated testing for the purpose
// of comparing the two algorithms.

// import relevant project files
const heldkarp = require('./held-karp.js');
const stochastic = require('./stochastic.js');
const fs = require('fs');

//
// main functions for experiments
//

// run tests for the time for heldkarp
function mainExperiment() {

    var h = heldkarp.tsp_hk;
    var s = stochastic.tsp_ls;
    const MAX_DISTANCE = 99;

    //var dataStream = fs.createWriteStream("results.txt");

    var hkDuration = [0, 0];
    var stochDuration = [0, 0];
    var i = 3;

    while (hkDuration[0] < 3600) {
        console.log(i);
        // create matrix
        const startTime = process.hrtime();
        const matrix = adjMatrixGenerator(i, MAX_DISTANCE);
        // run heldKarp
        const hkStartTime = process.hrtime();
        var heldkarpCost = 0;
        hkDuration = process.hrtime(hkStartTime);
        // run stochastic
        const stochStartTime = process.hrtime();
        var stochCost = s(matrix);
        const stochDuration = process.hrtime(stochStartTime);
        // output: startime,matrix,hkDuration,stochasticDuration,hkValue,stochasticValue
        fs.appendFileSync("results.txt", startTime[0].toString() +/* ",[" +*/
      //                      matrix + "]," +
                            hkDuration[0].toString() + "," +
                            (stochDuration[1]/1000000).toString() + "," +
                            heldkarpCost.toString() + "," +
                            stochCost.toString() + "\n");

        i++;
    }
/*
    fs.appendFileSync("-----------");
    console.log("Held-Karp Timed out.");

    while (stochDuration[0] < 3600) {
        console.log(i);
        // create matrix
        const startTime = process.hrtime();
        const matrix = adjMatrixGenerator(i, MAX_DISTANCE);
        // run stochastic
        const stochStartTime = process.hrtime();
        var stochCost = s(matrix);
        const stochDuration = process.hrtime(stochStartTime);
        // output: startime,matrix,hkDuration,stochasticDuration,hkValue,stochasticValue
        fs.appendFileSync( "results.txt", startTime[0].toString() + ",[" +
                            matrix + "]," +
                            stochDuration[0].toString() + "," +
                            stochCost.toString() + "\n");
        i++;
    }*/
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

    for (var i = 0; i < n; i++) {
        matrix[i][i] = 0;
    }

    return matrix;
}

//
// testing functions
//

// test the held-karp algorithm with a set of hand calculated values
function testHeldKarp(verb) {

    var f = heldkarp.tsp_hk;
    var u = 10000;

    // a set of test inputs and their expected outputs
    const gLinear = [ [0, 2, u], [u, 0, 2], [u, u, 0] ];
    const dLinear = 10004;
    const gNotAllConnected = [ [u, 1, 2, 5], [1, u, 1, u], [u, 1, u, 2], [u, 1, 1, u] ];
    const dNotAllConnected = 6;
    const gNotIdentity = [ [u, 1, 1, 1], [1, u, 1, 1], [1, 1, u, 1], [1, 1, 1, u] ];
    const dNotIdentity = 4;
    const gTwoPath = [ [u, 2, 4], [1, u, 4], [1, 3, u] ];
    const dTwoPath = 7;
    const gWiki = [ [0, 2, 9, 10], [1, 0, 6, 4], [15, 7, 0, 8], [6, 3, 12, 0] ];
    const dWiki = 21

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
        console.log("\nData:");
        console.log(gWiki);
        console.log("Expected Return Value:");
        console.log(dWiki);
        console.log("Return Value:");
        console.log(f(gWiki));
    }

    // print out non-verbose testing
    if (f(gLinear) == dLinear && f(gTwoPath) == dTwoPath && f(gNotAllConnected) == dNotAllConnected && f(gNotIdentity) == dNotIdentity && f(gWiki) == dWiki) {
        console.log("\n\nAll tests passed.");
    } else {
        console.log("\n\nTesting failed. Run verbose to see where.");
    }
}

// tests for helper functions of the heldKarp file
function testHeldKarpOther() {
    console.log("Just outputting some test values. This isn't a full or automated test.")
    console.log(heldkarp.test());
}

// test the stochastic local search (as much as you can with a randomized search method)
function testStochastic(verb) {
    var f = stochastic;
    const gWiki = [ [0, 2, 9, 10], [1, 0, 6, 4], [15, 7, 0, 8], [6, 3, 12, 0] ];
    const gNotIdentity = [ [0, 1, 2, 1], [1, 0, 1, 5], [1, 4, 0, 1], [1, 1, 3, 0] ];

    if (verb) {
        f.test();
        console.log("Check if the following value seem reasonable/execute without issue.");
        console.log(f.tsp_ls(gWiki));
        console.log(f.tsp_ls(gNotIdentity));
    }
    console.log("Unable to automate testing of randomized search. Helper functions checked with verb.")
}

//
// event handling
//

// check for command line arguments
// node testDriver.js [heldkarp, stochastic, adjMatrix] --[other args, true/false]
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
    } else if (process.argv[2] == 'adjMatrix') {
        console.log(adjMatrixGenerator(process.argv[3], 99));
    }
} else if (process.argv.length == 3) {
    if (process.argv[2] == 'heldkarp') {
        testHeldKarp(false);
    } else if (process.argv[2] == 'heldkarpother') {
        testHeldKarpOther();
    } else if (process.argv[2] == 'stochastic') {
        testStochastic(false);
    } else if (process.argv[2] == 'graphs') {
        testGraphs(false);
    } else if (process.argv[2] == 'time-exp') {
        mainExperiment();
    }
} else {
    console.log("Run `node testDriver.js help` to get help with arguments.");
}
