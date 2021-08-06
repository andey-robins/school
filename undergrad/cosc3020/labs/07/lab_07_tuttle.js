// lab 07 - COSC 3020 - Fall 2019
// Jacob Tuttle
// answers to written portions of the assignment included at the bottom of this file

// 1. Dijkstra's Algorithm
function dijkstra(adjMatrix) {

    var dist = [];
    var visited = [];

    // initialize dist with sentinal values for all vertices
    for (var i = 0; i < adjMatrix.length; i++) {
        dist[i] = -1;
        visited[i] = false;
    }

    dist[0] = 0;

    // while there are unmarked vertices left in the graph
    while (visited.indexOf(false) != -1) {

        // select the unmarked vertex v with the lowest dist
        var currentIndex = visited.indexOf(false);

        // select all unvisited nodes for exploration
        for (var i = 0; i < dist.length; i++) {
            if (!visited[i]) {
                if (dist[i] < dist[currentIndex] && dist[i] != -1) {
                    currentIndex = i;
                }
            }
        }

        // mark v with distance dist
        visited[currentIndex] = true;

        // for each edge out of v
        for (var i = 0; i < adjMatrix[currentIndex].length; i++) {
            // update distances in dist
            if (!visited[i] && adjMatrix[currentIndex][i]) {
                // if distance from here is less than distance in dist, update
                if (dist[i] <= 0 || dist[currentIndex] + adjMatrix[currentIndex][i] < dist[i]) {
                    dist[i] = dist[currentIndex] + adjMatrix[currentIndex][i];
                }
            }
        }
    }

    return dist;
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


// Testing

// main testing driver program
// verb is a boolean that denotes whether testing yields verbose output
function testDijkstra(verb) {

    // a set of test inputs and their expected outputs
    gTest1 = [ [0, 1, 2, 5], [0, 0, 0, 7], [0, 0, 0, 2], [0, 0, 0, 0] ];
    gTest2 = [ [0, 1, 0, 2, 0], [1, 0, 6, 2, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 3, 0, 0] ];
    gCycle = [ [0, 1, 0], [0, 0, 1], [1, 0, 0] ];
    gSelf = [ [1, 2, 0], [0, 1, 2], [0, 0, 1] ];
    dTest1 = [0, 1, 2, 4];
    dTest2 = [0, 1, 6, 2, 3];
    dCycle = [0, 1, 2];
    dSelf = [0, 2, 4];

    // print out verbose testing
    if (verb) {
        console.log("\nVerbose Testing: ");
        console.log("-----------------");
        console.log("\nAdjacency Matrix:");
        console.log(gTest1);
        console.log("Expected Return Value:");
        console.log(dTest1);
        console.log("Return Value:");
        console.log(dijkstra(gTest1));

        console.log("\nAdjacency Matrix:");
        console.log(gTest2);
        console.log("Expected Return Value:");
        console.log(dTest2);
        console.log("Return Value:");
        console.log(dijkstra(gTest2));

        console.log("\nAdjacency Matrix:");
        console.log(gCycle);
        console.log("Expected Return Value:");
        console.log(dCycle);
        console.log("Return Value:");
        console.log(dijkstra(gCycle));

        console.log("\nAdjacency Matrix:");
        console.log(gSelf);
        console.log("Expected Return Value:");
        console.log(dSelf);
        console.log("Return Value:");
        console.log(dijkstra(gSelf));
    }

    // print out non-verbose testing
    if (arrEqual(dTest1, dijkstra(gTest1)) && arrEqual(dTest2, dijkstra(gTest2)) && arrEqual(dCycle, dijkstra(gCycle)) && arrEqual(dSelf, dijkstra(gSelf))) {
        console.log("\n\nAll tests passed.");
    } else {
        console.log("\n\nTesting failed. Run verbose to see where.");
    }
}


// check for verbose output and begin testing
if (process.argv.length == 3) {
    if (process.argv[2] == 'true') {
        testDijkstra(true);
    } else {
        testDijkstra(false);
    }
} else {
    console.log("To see more verbose settings, pass true as a command line argument:\n`node lab_07_tuttle.js true`");
    console.log("To avoid seeing this message again, pass false as a command line argument instead.");
    testDijkstra(false);
}

// Big Θ Complexity of the Above Implementation
// Θ(|V|^2)
/*
    Initializing dist with sentinel values will execute in time linear with respect to the number of vertices
    The main while loop will execute once for each vertex, an operation that is linear with respect to the number
    of vertices; however, within that loop, the algorithm also checks every possible edge that could come out of
    that vertex, an operation that would take linear time on it's own. When nested within the while loop, the entire
    segment executes in |V|^2 time.
*/
