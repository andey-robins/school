//Chance McCormick
//Lab_06
//COSC 3020
//10/23/2019

'use strict'
test();
function depthFirstSearch(adjMatrix)
{
    var rootNode = 0; //root node is 0
    var nodesVisited = [];
        for (var i = rootNode; i < adjMatrix.length; i++)
        {

            nodesVisited[i]=false; //sets the number of nodes as not visited
        }
        depthFirstHelper(rootNode, nodesVisited, adjMatrix)
}

function depthFirstHelper(rootNode, nodesVisited, adjMatrix)
{
    nodesVisited[rootNode] = true;
    console.log(rootNode);
    for(var k=0; k < adjMatrix.length; k++)
    {
        if(((adjMatrix[rootNode][k])==1) && (nodesVisited[k]==false))
        {
            depthFirstHelper(k, nodesVisited, adjMatrix) //recursively iterates through edges of the current node
        }
    }
}
function test()
{
    var testMatrix = [
        [0,1,0,0,1,1], //index 0
        [0,0,1,0,1,0], //index 1
        [0,0,0,1,0,0], //index 2
        [0,0,0,0,1,0], //index 3
        [0,0,0,0,0,0], //index 4
        [0,0,0,0,0,0]  //index 5
    ]

    var testMatrix2 = [
        [0,1,1,0,0,1,0],//index 0
        [0,0,0,0,1,0,0],//index 1
        [0,0,0,1,0,0,0],//index 2
        [0,0,0,0,1,0,0],//index 3
        [0,0,0,0,0,0,0],//index 4
        [0,0,0,0,0,0,1],//index 5
        [0,0,0,0,0,0,0] //index 6
    ]
    console.log("Test Matrix 1");
    console.log("The depth first search returns: ");
    depthFirstSearch(testMatrix);
    console.log("");
    console.log("Test Matrix 2");
    console.log("The depth first search returns: ");
    depthFirstSearch(testMatrix2);

    console.log("\n\n");

    depthFirstSearch([ [0, 0, 0, 0, 1, 1], [0, 0,0, 0, 0, 0], [0, 0, 0, 0, 1, 0], [0, 1, 0, 0, 0, 0], [0, 0, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0 ]]);


}
