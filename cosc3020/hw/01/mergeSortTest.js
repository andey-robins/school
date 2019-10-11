const fs = require('fs');
const jsc = require('jsverify');

eval(fs.readFileSync('mergeSort.js')+'');

const testSort = jsc.forall("array nat", function(arr) {
    var a1 = JSON.parse(JSON.stringify(arr));
    var a2 = JSON.parse(JSON.stringify(arr));
    return JSON.stringify(sort(a1)) == JSON.stringify(a2.sort(function(a,b) {return a - b;}));
});

jsc.check(testSort);
