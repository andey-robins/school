// assignment 03 - COSC 3020 - Fall 2019
// Jacob Tuttle
//
// a file that implements the stochastic local search algorithm for the traveling salesman problem
// by randomly generating routes and checking them against the best found route so far.
// import to other files by using:
// const stochastic = require('./stochastic.js');

module.exports = {
    tsp_ls: function tsp_ls(adjMatrix) {
        return findPath(adjMatrix)
    },

    test: function t() {
        test();
    }
}

// the stochastic local search method
function findPath(adjMatrix) {
    var route = shuffle(genOrderedList(adjMatrix.length));
    var incumbent = walk(route, adjMatrix);
    var iterations = 0;

    while (!done(iterations, adjMatrix.length)) {
        var isnks = generateIK(adjMatrix.length);
        route = twoOptSwap(route, isnks[0], isnks[1]);
        var newIncumbent = walk(route, adjMatrix);

        if (newIncumbent < incumbent) {
            incumbent = newIncumbent
        }
    }
    return incumbent;
}

//
// helper functions
//

// randomize an array
function shuffle(list) {
    return list.sort(function() {
        return 0.5 - Math.random();
    })
}

// calculate the path cost by walking the path
function walk(route, adjMatrix) {
    var cost = 0;
    for (var i = 1; i < route.length; i++) {
        cost += adjMatrix[route[i - 1]][route[i]];
    }
    return cost;
}

// when should it stop?
// let's say after n^2 checks
function done(iterations, length) {
    return (iterations < length * length);
}

// generate an ordered list with size elements, 0 indexed
function genOrderedList(size) {
    ns = [];
    for (var i = 0; i < size; i++) { ns.push(i); }
    return ns;
}

// picking i and k
// i is random between 0 and length - 1
// k is random between i and length // WORKS
function generateIK(length) {
    var i = Math.floor(Math.random() * length);
    var k = Math.floor(Math.random() * (length - i)) + i + 1;
    return [i, k];
}

// properly switches an internal segment of the route for the search //WORKS
function twoOptSwap(route, i, k) {
    return route.slice(0, i).concat(route.slice(i, k+1).reverse().concat(route.slice(k+1, route.length)));
}

//
// testing functions
//

// basic test driver for all of the helper functions in this file
function test() {
    console.log(twoOptSwap([0, 1, 2, 3, 4, 5], 2, 4))
    console.log([0, 1, 4, 3, 2, 5]);
    console.log(generateIK(5));
    var a = [ [0, 3, 2], [1, 0, 1], [2, 5, 0]];
    console.log(walk([2, 1, 0], a));
    console.log(walk([1, 0, 2], a));
    console.log(walk([0, 2, 1], a));
    console.log(genOrderedList(6));
    console.log(genOrderedList(10));
    console.log(shuffle(genOrderedList(6)));
    console.log(shuffle(genOrderedList(6)));
    console.log(search(a));
}
