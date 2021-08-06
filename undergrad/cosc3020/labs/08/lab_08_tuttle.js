// lab 08 - COSC 3020 - Fall 2019
// Jacob Tuttle
// answers to written portions of the assignment located at the bottom of the page

// 1. All-Pairs Shortest Paths
// weights is a weighted graph
// returns the matrix with the shortest distances from any one node to any other
function allPairsShortestPath(weights) {

    // initialize dist for computation
    var dist = []
    for (var i = 0; i < weights.length; i++) {
        var tmp = []
        for (var j = 0; j < weights[i].length; j++) {
            // initialize the values of dist in accordance with the Floyd-Warshall algorithm
            // 0 if it's to itself
            if (i === j) {
                tmp.push(0);
            // the correct weight if it exists
            } else if (weights[i][j]) {
                tmp.push(weights[i][j])
            // infiity otherwise
            } else {
                tmp.push(Infinity);
            }
        }
        dist.push(tmp);
    }

    // perform the traversal to find each shortest path
    for (var k = 0; k < weights.length; k++) {
        for (var i = 0; i < weights.length; i++) {
            for (var j = 0; j < weights.length; j++) {
                // update new distances if a shorter one is found
                if (dist[i][j] > dist[i][k] + dist[k][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }
    return dist;
}


// Testing

// test if two arrays are equal
// with respect to each element within being equal and in the same position
function arrEqual(a1, a2) {
    if (a1.length != a2.length) {
        return false;
    } else {
        for (var i = 0; i < a1.length; i++) { if (a1[i] != a2[i]) { return false; } }
    }
    return true;
}

// driver function to test if two nested arrays are equal using arrEqual
function nestedArrEqual(a1, a2) {
    if (a1.length != a2.length) {
        return false;
    } else {
        for (var i = 0; i < a1.length; i++) { if (!arrEqual(a1[i], a2[i])) { return false; } }
    }
    return true;
}

// main test driver program
// verb is a bool that denotes whether testing yields verbose output
function testMain(verb) {

    var f = allPairsShortestPath;

    // a set of test inputs and their expected outputs
    gFull = [ [0, 1, 1], [1, 0, 1], [1, 1, 0] ];
    dFull = [ [0, 1, 1], [1, 0, 1], [1, 1, 0] ];
    gTest1 = [ [0, 1, 2, 7], [1, 0, 0, 8], [2, 0, 0, 2], [7, 8, 2, 0] ];
    dTest1 = [ [0, 1, 2, 4], [1, 0, 3, 5], [2, 3, 0, 2], [4, 5, 2, 0] ];
    gTest2 = [ [0, 1, 0, 0, 1], [1, 0, 2, 3, 5], [0, 2, 0, 3, 0], [0, 3, 3, 0, 2], [1, 5, 0, 2, 0] ];
    dTest2 = [ [0, 1, 3, 3, 1], [1, 0, 2, 3, 2], [3, 2, 0, 3, 4], [3, 3, 3, 0, 2], [1, 2, 4, 2, 0] ];

    // print out verbose testing
    if (verb) {
        console.log("\nVerbose Testing: ");
        console.log("-----------------");

        console.log("\nData:");
        console.log(gFull);
        console.log("Expected Return Value:");
        console.log(dFull);
        console.log("Return Value:");
        console.log(f(gFull));

        console.log("\nData:");
        console.log(gTest1);
        console.log("Expected Return Value:");
        console.log(dTest1);
        console.log("Return Value:");
        console.log(f(gTest1));

        console.log("\nData:");
        console.log(gTest2);
        console.log("Expected Return Value:");
        console.log(dTest2);
        console.log("Return Value:");
        console.log(f(gTest2));
    }

    // print out non-verbose testing
    if (nestedArrEqual(dFull, f(gFull)) && nestedArrEqual(dTest1, f(gTest1)) && nestedArrEqual(dTest2, f(gTest2))) {
        console.log("\n\nAll tests passed.");
    } else {
        console.log("\n\nTesting failed. Run verbose to see where.");
    }

}

// check for verbose output and begin testing
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

// Big Θ Complexity of the Above Implementation
// Θ(|V|^3)
// in the above Implementation, there are two for loops with runtimes of
// |V|^2 and |V|^3 respectively. Through asymptotic analysis, we conclude
// that the highest order term produces a Θ of Θ(|V|^3)
