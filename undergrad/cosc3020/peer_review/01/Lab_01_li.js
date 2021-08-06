//Lab1


function insertionSort(arr){
	for(var i = 1; i < arr.length; i++){
		var val = arr[i];
		var j;
		for(j = i; j > 0 && arr[j-1] > val; j--){
			arr[j] = arr[j-1];
		}
		arr[j] = val;
	}
	return arr;
}

function insertionSortReverse(arr1){
	for(var i = arr.length - 2; i >= 0; i--){
		var val = arr[i];
		var j;
		for(j = i; j < arr.length -1 && arr[j+1] < val; j++){
			arr[j] = arr[j+1];
		}
		arr[j] = val;
	}

	return arr
}

var arr = [2,5,3,8];
console.log(insertionSort(arr));

var arr1 = [4,8,1,12,6];
console.log(insertionSortReverse(arr1));

/*
when input is reverse runtime is O(n^2)
the average case complexity will run Θ(n^2)
*/
