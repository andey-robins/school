//Maria Swartz
//10-02-19
//COSC3020 - Alg & Data Structures
//Lab04
//I received help from my lab partner Connor Kasarda

/*Testing to understand how the recursion will work
function one(a)
{
    var output = [];
    if(a.length == 1)
    {
        return a;
    }
}

function two(a)
{
    var output = [];
    if(a.length == 1)
    {
        return a;
    }
    else{

        //permutation 1
        output.push([a[0]].concat([a[1]]));
        //permutation 2
        output.push([a[1]].concat([a[0]]));
        return output;
    }
}

function three(a)
{
    output = [];

    output.push([a[0]].concat([a[1]].concat([a[2]])));
    output.push([a[0]].concat([a[2]].concat([a[1]])));

    output.push([a[1]].concat([a[0]].concat([a[2]])));
    output.push([a[1]].concat([a[2]].concat([a[0]])));

    output.push([a[2]].concat([a[1]].concat([a[0]])));
    output.push([a[2]].concat([a[0]].concat([a[1]])));

    return output;
}
*/

function perm(a)
{
    var output = [];
    //Base case; recursion stops here
    if(a.length == 1)
    {
        return a;
    }
    //Recursive part
    for(var i=0; i<a.length; i++)
    {
        var head = a[i];
        //All the elements in the array, except the head
        var rest = a.slice(0, i).concat(a.slice(i+1));
        //Find all the permutations of the rest
        var tail = perm(rest);
        //Find all permutations of the tail
        for(var j=0; j<tail.length; j++)
        {
            output.push([head].concat(tail[j]));
        }
    }
    return output;
}

function permutationSort(a)
{
    var bigArr = perm(a);
    var sortedArr = insertionSort(a);
    for(var i = 0; i<bigArr.length; i++)
    {
        //compare if permutation i is the sorted array
        if(JSON.stringify(bigArr[i]) == JSON.stringify(sortedArr))
        {
            a = bigArr[i];
            return i+1;
        }
    }
    //an error occurred because none of the permutations is sorted
    return -999;
}



//implementation of the insertion sort found in lecture 1, PDF slide 7

    function insertionSort(arr) {
        for(var i = 1; i < arr.length; i++) {
            var val = arr[i];
            var j;
            for(j = i; j > 0 && arr[j-1] > val; j--) {
                arr[j] = arr[j-1];
            }
            arr[j] = val;
        }
        return arr;
    }


//console.log(one([2]));
//console.log(two([3,4]));
//console.log(three([3,4, 5]));
console.log(perm([3,2,1]));
console.log(perm([4,2,6,1]));
console.log(permutationSort([3,2,1]));
console.log(permutationSort([3,5,7]));
console.log(permutationSort([4,2,6,1]));
//console.log(insertionSort([2,5,1, 8, 2, 99, -6]));

