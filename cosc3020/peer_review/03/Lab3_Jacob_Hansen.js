// Jacob Hansen
// COSC 3020
// Lab 3
// 9/25/2019

//referenced w3schools.com for clarification on array.slice method

function divideAndConqurSum( a ){
	//dividing array length by 3, we are likely to get array size of 0 and 1, these are the base cases
	var arrayLength = a.length;
	if( arrayLength == 0 ){
		return 0;
	}
	
	else if( arrayLength == 1 ){
		return a[0];
	}
	
	else{
		var splitPointI = arrayLength / 3;
		var splitPointJ = arrayLength * 2 / 3;
		var sum = 0;
		
		//recursive calls on each third of array respectively, adding the results to local variable sum
		sum += divideAndConqurSum( a.slice( 0, splitPointI ) );
		sum += divideAndConqurSum( a.slice( splitPointI, splitPointJ ) );
		sum += divideAndConqurSum( a.slice( splitPointJ, arrayLength ) );
		
		return sum;
	}
}


function testDivideAndConqurSum(){
	console.log("First test: numbers 0-10 in a random order. Result should be 55. Array length is 11. (11 % 3 = 2)");
	var array1 = [ 5, 10, 6, 9, 0, 2, 1, 4, 7, 3, 8 ];
	console.log(divideAndConqurSum(array1));
	
	console.log("Second test: squared numbers of 1-9 in ascending order. Result should be 285. Array length is 9. (9 % 3 = 0)");
	var array2 = [ 1, 4, 9, 16, 25, 36, 49, 64, 81 ];
	console.log(divideAndConqurSum(array2));
	
	//utilized google's rng widget to generate values in array3
	
	console.log("Third test: randomly generated list (values 1-100), Result should be 570. Array length is 10 (10 % 3 = 1)");
	var array3 = [ 33, 74, 54, 51, 68, 92, 67, 35, 57, 39 ];
	console.log(divideAndConqurSum(array3));
}
	

testDivideAndConqurSum()