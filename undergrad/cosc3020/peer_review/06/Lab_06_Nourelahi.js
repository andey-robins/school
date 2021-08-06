
/// Three example to see if my code works and it works!

adjlist = [[1, 4], [2, 3], [], [], [5, 6], [], []];
adjlist1=[[4,5],[],[6],[],[1,2],[3],[]];
adjlist2=[[8,9],[5,7],[0,6],[],[1,2,3],[],[],[],[],[]]; // For this example we are gonna start from node 4
                                                        // since it is the upest node in this adjacency list.

function dfs(adjlist, a, node) {        // depth first search function. node is our starter node(vertice).
                                        // a is the list that we want to save our visited node which I use as an empty array.
    if (!a.includes(node)) {
        a.push(node);
    }
    for (var i = 0; i < adjlist[node].length; i++) {       // will go through all edges and vertices of that specific node eventually.
        dfs(adjlist, a, adjlist[node][i])
    }
    return a;
}

console.log("adjlist= ", adjlist);
console.log("output for adjlist= ",dfs(adjlist,[],0));

console.log("-------------------------------------------");

console.log(dfs([ [4, 5], [], [5], [1], [2, 3], [] ], [], 0));

console.log("adjlist1= ", adjlist1);
console.log("output for adjlist1= ", dfs(adjlist1, [], 0));

console.log("-------------------------------------------");

console.log("adjlist2= ", adjlist2);
console.log("output for adjlist(starting from node 4)= ", dfs(adjlist2, [], 4));


//// About Runtime:

// Runtime complexity: the function "includes" would go through the array to find out if that node exist in the array which
// in the worst case would be like  O(V) since it should go through all vertices in the worst case. In the for loop and recursion function
// we are gonna reach to every vertice and edge just once, so it would be like O(V+E), so in total it will be O(V+E)+O(V) and
// eventually we can write it like O(V+E).
// It should have been noted since I used adjacency list as graph representation, it turned out to be O(V+E) and in the case of using
// adjacency matrix O(V^2) will be our runtime complexity.
