// Connor Kasarda
// Lab partner: Maria Swartz
// COSC3020
// Lab 05

// Adjacency matrices
var matrix1 = [[0,1,0],
               [1,0,1],
               [0,1,0]];
var matrix2 = [[0,1,0,0,0,1],
               [1,0,0,1,1,0],
               [0,1,0,0,1,0],
               [1,1,1,0,0,0],
               [0,1,0,1,0,1],
               [1,1,1,1,1,0]];
var matrix3 = [[0,1,0,1],
               [1,0,1,1],
               [0,1,0,0],
               [1,1,1,0]];
var matrix4 = [[0, 0], [0, 0]];

function convertToAdjList(adjMatrix) {
    var list = {}; // Initialize the dictionary to hold the adjacency list
    for (var i = 0; i < adjMatrix.length; i++) { // Iterate over each vertex
        list[i] = []; // Initialize a list for edges
        for (var j = 0; j < adjMatrix[i].length; j++) {
            if (adjMatrix[i][j] == 1) list[i].push(j); // Iterate over each possible edge
        }
    }
    return list; // Return the adjacency list implimented with a dictionary
}

// Tests:
console.log("Matrix to list test #1:\n", matrix1);
console.log(convertToAdjList(matrix1));
console.log("\nMatrix to list test #2:\n", matrix2);
console.log(convertToAdjList(matrix2));
console.log("\nMatrix to list test #3:\n", matrix3);
console.log(convertToAdjList(matrix3));
console.log(convertToAdjList(matrix4));
