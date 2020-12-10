
// Joshua Blaney
// Assignment 1
// Oct 10, 2019





function sortCheck(a){
	var sorted = true;
	for(var i = 0; i < a.length; i++){if(a[i] > a[i+1]){sorted = false;}}
	return sorted;
}

function shift(list, s1, s2){
	for(var i = s2; i > s1; i--){
		list[i] = list[i - 1];
	}
}

function sort(list,s1,s2,jump){
	var low, high, len;
	low = s1;
	high = s2;
	len = list.length - 1;
	while(s1 < low + jump - 1){
		if(s1 == s2){break;}
		else if(list[s1] < list[s2]){s1++;}
		else{
			swap = list[s2];
			shift(list,s1,s2);
			list[s1] = swap;
			s1++;
			if(s2 < len && s2 < high + (jump/2)){s2++;}
		}
	}
}

function mergeSort(list){
	if(sortCheck(list)){return list;}
	var i, j, k, n, m, len, done;
	len = list.length;
	k = 1;
	n = 2;
	m = 0;
	while (m < len){
		k = 0;
		while(k < len){
			i = 0;
			j = n/2;
			done = false;
			while(j < len){
				sort(list,i,j,n);
				j = j + n;
				i = i + n;
			}
			k++;
			n = 2**k;
		}
		m++;
	}	
	console.log(list);
	return list;
}




const fs=require('fs');
const jsc=require('jsverify');
eval(fs.readFileSync('C:\\Users\\Todd\\Documents\\COSC3020\\As_01_blaney.js')+'');
const testSort=jsc.forall("arraynat",function(arr){
	var a1=JSON.parse(JSON.stringify(arr));
	var a2=JSON.parse(JSON.stringify(arr));
	return JSON.stringify(insertionSortReverse(a1)) == 
	JSON.stringify(a2.sort(function(a,b){return a-b; }));
});
jsc.check(mergeSort);

console.log(jsc)