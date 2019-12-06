// assignment 03 - COSC 3020 - Fall 2019
// Jacob Tuttle
//
// a class file for a graph object

class Graph {
    constructor(adjMatrix) {
        this.edges = [];
        this.nodes = [];

        for (var i = 0; i < adjMatrix.length; i++) {
            this.nodes.push(new Node(i));
        }

        for (var i = 0; i < adjMatrix.length; i++) {
            for (var j = 0; j < adjMatrix[i].length; j++) {
                this.edges.push(new Edge(this.nodes[i], this.nodes[j]));
            }
        }
    }
}

// parts of the graph object that aren't worth putting in separate files.
class Node {
    constructor(i) {
        this.node = i;
        this.visited = false;
    }

}

class Edge {
    constructor(i, j) {
        this.home = i;
        this.end = j;
    }
}

// node.js export to make this class a module.
module.exports = Graph;
