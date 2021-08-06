// assignment 03 - COSC 3020 - Fall 2019
// Jacob Tuttle
//
// a file that implements the dynamic programming algorithm for the traveling salesman problem
// -- the held-karp algorigthm --
// import to other files by using:
// const heldkarp = require('./held-karp.js');

var distance = [];

module.exports = {
    tsp_hk: function tsp_hk(adjMatrix) {
        // setup values for calculation
        distance = adjMatrix;
        var cities = genOrderedList(distance.length);
        // do the actual calculation
        return findPathMem(peel(cities, 0), rest(cities, peel(cities, 0)));
    },
    test: function t() {
        test();
    }
}

// main calculation function
// uses the notation and pseudocode from https://en.wikipedia.org/wiki/Held%E2%80%93Karp_algorithm
function findPath(x, s) {
    if (s.length == 0) {
        return distance[0][x];
    } else if (s.length == 1) {
        return distance[peel(s, 0)][x] + distance[0][peel(s, 0)];
    } else if (s.length >= 2) {
        var options = [];
        for (var i = 0; i < s.length; i++) { options.push(distance[peel(s, i)][x] + findPath(peel(s, i), rest(s, peel(s, i)))); }
        return Math.min.apply(null, options);
    }
}

const memory = new Map();
// find path with memoization
function findPathMem(x, s) {
    if (s.length == 0) {
        memory.set([x, s], distance[0][x])
        return distance[0][x];
    } else if (s.length == 1) {
        memory.set([x,s], distance[peel(s, 0)][x] + distance[0][peel(s, 0)])
        return distance[peel(s, 0)][x] + distance[0][peel(s, 0)];
    } else if (s.length >= 2) {
        var options = [];
        for (var i = 0; i < s.length; i++) {
            if (memory.has([x, s])) {
                options.push(distance[peel(s, i)][x] + memory.get([x, s]));
            } else {
                options.push(distance[peel(s, i)][x] + findPath(peel(s, i), rest(s, peel(s, i))));
            }
        }
        memory.set([x, s], Math.min.apply(null, options))
        return Math.min.apply(null, options);
    }
}

//
// helper functions
//

// generate an ordered list with size elements, 0 indexed
// tested in stochastic.js
function genOrderedList(size) {
    ns = [];
    for (var i = 0; i < size; i++) { ns.push(i); }
    return ns;
}

// get all of the peels for the set s //WORK
function peel(s, index) { return s[index]; }

// get the rest of s, not including the peel //WORK
function rest(s, peel) { return s.filter(x => x != peel); }

//
// testing functions
//

// generic test function that outputs some values to be manually checked against expected vals
function test() {
    var s = [0, 1, 2, 3];
    console.log(peel(s, 0));
    console.log(rest(s, peel(s, 0)));
    console.log(peel(s, 2));
    console.log(rest(s, peel(s, 2)));
    console.log(g(2, []));
    console.log(g(3, [1]));
    console.log(g(2, [1]));
    console.log(g(3, [1, 2]));
    console.log(g(0, [1, 2, 3]));
}
