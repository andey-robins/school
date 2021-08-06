//Kyler Freeman


//a is an array
// recusively call and divide array. at base case add values
// so to split the array into 3 parts
// [1,2,3,4,5,6]
// 


function divideAndConquerSum(a){
	var sum = 0;
	 sum = divideAndConquer(a,sum);
	 return sum;
}
function divideAndConquer(a,sum) {
	console.log(JSON.parse(JSON.stringify(a)));
		if(a.length < 1) {				//c1
			return;
		}
		if(a.length == 1) {				//c2
			sum = sum + a[0];
			return sum;
		}
		else if (a.length == 2) {		//c3
			sum = sum + a[0] + a[1];
		    return sum;
		}
			
		else {

			var arr1 = a.slice(0,Math.floor(a.length/3));	//c4
			 var arr2 = a.slice(Math.floor(a.length/3),2*Math.floor(a.length/3));	//c5
			 var arr3 = a.slice(2* Math.floor(a.length/3),a.length);	//c6
		}
		sum =  divideAndConquerSum(arr1,sum);		//n/3
		sum =  divideAndConquerSum(arr2,sum);		//n/3
		sum =  divideAndConquerSum(arr3,sum);		//n/3
		return sum;
}

function testMerge() {
	var testArr = [];
		for (var i = 1; i < 21; i++){
			testArr.push(i);
		}
		console.log("Value of sum: " + divideAndConquerSum(testArr));
	}

testMerge();



/*

1. If the arrays length is < 1 return T(1) = 1
2. If the arrays length is 1 return the element  T(1) = 1
3. If the arrays length is 2 return the sum of the elements T(1) = 1
4. else split the array into 3 parts T(1) = 1 
5. Call divideAndConquerSum for each part 3T(n/3)
	
T(n) {
	1			if (n <= 2)
	3T(n/3)		if (n > 2)


	Substitution
	T(n) = 3T(n/3)
	=  	   3(3T(n/9))
	=		9T(n/9)
	=		27T(n/27)
	= 3^i T(n/3^i)


}for i = lgbase3 n



n T(1) +





*/