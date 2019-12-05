
/*

Assignment 2, Problem 3
11/12/19

By Jason Fantl and Jacob Tuttle

*/

// augmentingPath returns an array of nodes, creating a path from the start node to the end node using depth first search
// an empty array is returned if no path exists
function augmentingPath(graph, start, end) {
    // create a visted array
    let visted = new Array(graph.length).fill(false);
    // create the augemented path
    let path = [];
    path.push(start);

    // while we havent exhausted the paths and we haven't reached the end
    while (path.length <= graph.length && path.length != 0 && path[path.length - 1] != end) {
        let currentNode = path[path.length - 1];
        visted[currentNode] = true;

        // find the next node that hasn't been visted and were connected to where it isnt a connection to itself
        let i = 0;
        while (visted[i] || i == currentNode || graph[currentNode][i] == 0) {
            i++;
        }
        // if we found a new node, add it to the path
        if (i < graph.length) {
            path.push(i);
        }
        //otherwise we hit a dead end and need to go back a node
        else {
            path.pop();
        }
    }
    return path;
}


function augmentingPathTest() {

    let testAdjacencyMatrixs = [];

    // Generate test ajacency matrix
    for (let i = 0; i < 10; i++) {
        let listSize = 1 + Math.floor(Math.random() * 10);
        let testAdjacencyMatrix = [];

        for (let row = 0; row < listSize; row++) {
            let connections = []
            for (let row = 0; row < listSize; row++) {
                if (Math.random() > 0.5) {
                    connections.push(Math.floor(Math.random() * 10));
                } else {
                    connections.push(0);
                }
            }
            testAdjacencyMatrix.push(connections);
        }
        testAdjacencyMatrixs.push(testAdjacencyMatrix);
    }

    // for each test ajacency matrix, print the matrix and an augmented path
    for (let i = 0; i < testAdjacencyMatrixs.length; i++) {
        console.log("Adjacency List:");
        console.log(testAdjacencyMatrixs[i]);

        let start = Math.floor(Math.random() * testAdjacencyMatrixs[i].length);
        let end = Math.floor(Math.random() * testAdjacencyMatrixs[i].length);
        console.log("A random path from ", start, " to ", end);
        console.log(augmentingPath(testAdjacencyMatrixs[i], start, end));
    }
}

augmentingPathTest();