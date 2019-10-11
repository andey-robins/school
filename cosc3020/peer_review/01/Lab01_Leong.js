<html>
<script>
var array = [2, 11, 5, 1, 9, 10, 21];
var array1 = [2, 9, 1, 3, 6];

function insertionSort(arr) {
	for(var i = 1; i < arr.length; i++) {
		var val = arr[i];
		var j;
		for(j = i; j > 0 && arr[j-1] > val; j--) {
			arr[j] = arr[j-1];
			}
			arr[j] = val;
			}
printArray(arr);          //call print function
return arr;
}

function insertionSortReverse(arr){
	for(var i=(arr.length-1); i >= 0 ; i--){
		var val = arr[i];
		var j 
		for(j=i; j<arr.length&&arr[j+1]<val;j++){
			arr[j] = arr[j+1];
		}
		arr[j] = val;
	}
printArray(arr);          //call print function
return arr;
}

//output array function
function printArray(arr){
	//store array as a string, each element separated by ', '
	var str = arr.join(', ');
	console.log('Array after sorting ['+str+']');
}

//call sort functions
console.log('Array before sorting [2, 11 , 5 , 1, 9, 10, 21]');
insertionSort(array);
console.log('Array before sorting [2, 9, 1, 3, 6]');
insertionSortReverse(array1);

/*Question 2
If from the begining the array is in a random numerical order, 
then generally we can expect that each element is less than half the elements 
to its left. In this instance, a call to swap array of n elements would swap
n/2 of them. Therefore, the running time will be half of the worst case 
running time. Since we don't care about constant factors in asymptotic analysis, 
the time complexity of the average case would be Θ(n^2), the same as the worst case
time complexity*/

</script>
</body>
</html>
