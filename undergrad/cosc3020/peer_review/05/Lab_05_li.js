

function convertToAdjlist(adjMatrix){
    var vertices = adjMatrix.length; 
    var adjList = new Array(vertices);


        for(var i=0;i<vertices;++i){
        adjList[i] = [];
        for(var j=0;j<vertices;++j){
            if(adjMatrix[i][j] == 1)
                adjList[i].push(j);
        }
    }
    return adjList;
}

function test(){
    test1 = [[0, 1, 1],
             [0, 0, 1],
             [1, 0, 0]];
    test2 = [[0, 1, 0, 1],
             [0, 0, 1, 1],
             [1, 0, 0, 1],
             [0, 1, 0, 0]];
    console.log(convertToAdjlist(test1));
    console.log(convertToAdjlist(test2));
    }
    test();


/*

*/

