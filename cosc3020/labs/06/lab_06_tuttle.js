// lab 06 - COSC 3020 - Fall 2019
// Jacob Tuttle
// answers to written portions of the assignment included at the bottom of this file

// 1. Depth First Search
// a depth first traversal of a graph
function depthFirstSearch(adjList) {
    var visited = {}

    // fill visited with all nodes
    for (var i = 0; i < adjList.length; i++) {
        visited[i] = false;
    }

    // visit the first node
    visited[0] = true;
    path = [0]

    // begin recursive traversal
    dfs(adjList, 0, visited, path);

    // return depth first traversal path
    return path;
}

// tail-recursive traversal function
// stores the path as it is expanded in path
function dfs(list, v, visited, path) {

    // iterate through the edges coming out of the current vertex
    for (var edge = 0; edge < list[v].length; edge++) {

        // if not visited, explore the vertex on the current edge
        if (!visited[list[v][edge]]) {
            visited[list[v][edge]] = true;
            path.push(list[v][edge]);
            dfs(list, list[v][edge], visited, path);
        }
    }
    return;
}

// testing function
// if graphs match expected outputs, then the function is working as expected
function testDepthFirstSearch(verb) {

    // a fun set of test inputs for the functions and their expected counterparts
    var testGraphL = [ [1], [2], [3], [] ];
    var expectedL = [ 0, 1, 2, 3 ];
    var testGraph1 = [ [1], [1, 2], [0, 1] ];
    var expected1 = [0, 1, 2];
    var testGraph2 = [ [2, 3], [1, 2, 3], [0, 1], [2] ];
    var expected2 = [0, 2, 1, 3];
    var testGraph3 = [ [1, 2], [], [3], [] ];
    var expected3 = [0, 1, 2, 3];
    var testGraph4 = [ [4, 5], [], [5], [1], [2, 3], [] ];
    var expected4 = [0, 4, 2, 5, 3, 1];

    // print out verbose testing
    if (verb) {
        console.log("\nVerbose Testing: ");
        console.log("-----------------");
        console.log("Adjacency List to traverse:");
        console.log(testGraphL);
        console.log("Result should be: " + expectedL);
        console.log(depthFirstSearch(testGraphL));
        console.log("\nAdjacency List to traverse:");
        console.log(testGraph1);
        console.log("Result should be: " + expected1);
        console.log(depthFirstSearch(testGraph1));
        console.log("\nAdjacency List to traverse:");
        console.log(testGraph2);
        console.log("Result should be: " + expected2);
        console.log(depthFirstSearch(testGraph2));
        console.log("\nAdjacency List to traverse");
        console.log(testGraph3);
        console.log("Result should be: " + expected3);
        console.log(depthFirstSearch(testGraph3));
        console.log("\nAdjacency List to traverse")
        console.log(testGraph4);
        console.log("Result should be: " + expected4);
        console.log(depthFirstSearch(testGraph4));
    }

    // print out non-verbose testing
    if (arrEqual(expectedL, depthFirstSearch(testGraphL)) && arrEqual(expected1, depthFirstSearch(testGraph1)) && arrEqual(expected2, depthFirstSearch(testGraph2)) && arrEqual(expected3, depthFirstSearch(testGraph3)) && arrEqual(expected4, depthFirstSearch(testGraph4))) {
        console.log("\n\nAll tests passed.");
    } else {
        console.log("\n\nTesting failed. Check above to see where.");
    }

}

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

// check for verbose output
if (process.argv.length == 3) {
    if (process.argv[2] == 'true') {
        testDepthFirstSearch(true);
    } else {
        testDepthFirstSearch(false);
    }
} else {
    console.log("To see more verbose settings, pass true as a command line argument:\n`node lab_06_tuttle.js true`");
    testDepthFirstSearch(false);
}

// Worst case time complexity
/*
    The worst case time complexity for my implementation would be Θ(|E| + |V|). The worst case would be a graph that simply
    represented a linked list. Each edge would be traversed once during the depth first traversal and each vertex will
    be visited twice, once when creating the visited hash map and once when marking it visited. This simplifies to a time
    complexity of |E| + 2|V| or Θ(|E| + |V|) asymptotically.
*/
