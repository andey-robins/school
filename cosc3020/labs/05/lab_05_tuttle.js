// lab 05 - COSC 3020 - Fall 2019
// Jacob Tuttle
// answers to written portions of the assignment included as an attached pdf file

// 1. Graph Representations
// a function for converting an adjacency matrix to an adjacency list
function convertToAdjList(adjMatrix) {

    var adjList = [];

    for (var row = 0; row < adjMatrix.length; row++) {
        var tmp = [];
        for (var col = 0; col < adjMatrix[row].length; col++) {
            if (adjMatrix[row][col] == 1) {
                tmp.push(col);
            }
        }
        adjList.push(tmp);
    }

    return adjList;
}

// a function to test the convertToAdjList function with a set of hand tracked inputs
function testConverter() {
    console.log("Testing assorted adjacency matrices conversions to adjacency lists.");

    console.log("\n\n--- Test 1 ---");
    console.log("Expected List: \n[ [1], [1, 2], [0, 1] ]");
    tmp = convertToAdjList([[0,1,0],[0,1,1],[1,1,0]]);
    console.log("Returned List: ");
    console.log(tmp);

    console.log("\n\n--- Test 2 ---");
    console.log("Expected List: \n[ [0, 1], [0, 1] ]");
    tmp = convertToAdjList([[1, 1], [1, 1]]);
    console.log("Returned List: ");
    console.log(tmp);

    console.log("\n\n--- Test 3 ---");
    console.log("Expected List: \n[ [], [] ]");
    tmp = convertToAdjList([[0,0],[0,0]]);
    console.log("Returned List: ");
    console.log(tmp);

    console.log("\n\n--- Test 4 ---");
    console.log("Expected List: \n[ [2, 3], [1, 2, 3], [0, 1], [2] ]");
    tmp = convertToAdjList([ [0, 0, 1, 1], [0, 1, 1, 1], [1, 1, 0, 0], [0, 0, 1, 0] ]);
    console.log("Returned List: ");
    console.log(tmp);
}

testConverter();

// 2. Runtime Analysis
// included in the attached pdf
