<html>
<script>


var graph = [ [0,0,1,5,2,2], [1,0,0,5,3,4], [2,0,0,2,5,6], [3,0,1,4,4,8,5,2], [4,0,3,8], [5,0,2,6,3,2]];
var goal = 5;


testing(graph, goal);

function dijktra(graph, inner, goal, lengthtoadd, currentlength, lowestlength){
	//check if goal
	if(inner[0] == goal){
		return currentlength + lengthtoadd;
	}
	
	//base case
	if(inner.length == 2){
		return 0;
	}
	//go to next edge
	for (var i = 2; i < inner.length; i = i+2){
		var costsofedge = [];
		for(var k = 3; k < inner.length; k + k+2){
			costsofedge.push(inner[k]);
		}
		var lowestedge;
		for(var k = 1; k < costsofedge.length; k++){
			if (costsofedge[k] < lowestedge)
				lowestedge = costsofedge[k];
		}
		currentlength = currentlength + dijktra(graph, graph[lowestedge],inner[i+1], goal, lowestlength);
		if (currentlength<lowestlength)
			lowestlength = currentlength;
		
	}
	return currentlength;
}


function testing(graph,goal){
	var length = dijktra(graph, graph[0], goal, 0, 0, 1000000000000);
	console.log("Lowest length to goal is: " + length);
}
</script>
</body>
</html>