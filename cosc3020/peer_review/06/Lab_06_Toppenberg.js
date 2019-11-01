//Jordan Toppenberg
//COSC 3020
//Lab 6
//October 25, 2019

/*
receive adjacency matrix
start node, process neighbors (for each edge/neighbor)
node 1 [[2, 3],      [0 1 1 0 0 0
node 2  [1],          1 0 0 0 0 0
node 3  [1, 4],       1 0 0 1 1 0
node 4  [3]           0 0 1 0 0 0
node 5  [3, 6],       0 0 0 1 0 1
node 6  [5]]          0 0 0 0 1 0]

*/


function createVisited(arr){
var visited = [];
	for (var i=0;i<arr.length;++i){
		visited[i]=false;
	}
    return visited;
}

function DFS(i, arr, visited){
	if(!visited[i]){
		visited[i]=true;

		for(var j =0;j<arr[i].length;j++){
			if(arr[i][j]==1&&!visited[j]) {
                console.log("visited node: " +i)
				DFS(j,arr,visited);
			}
		}
	}
}

function DFSInit(arr){
    var visited = createVisited(arr)
	var count = 0;
	for(var i=0; i<arr.length;i++){
		if(!visited[i]){
			DFS(i,arr,visited);
			++count;
		}
	}
}

DFSInit([ [0, 0, 0, 0, 1, 1], [0, 0,0, 0, 0, 0], [0, 0, 0, 0, 1, 0], [0, 1, 0, 0, 0, 0], [0, 0, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0 ]]);

/*
The worst case Big Theta woulb be (n^2+2n).

*/
