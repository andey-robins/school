module.exports = {
    tsp_hk: function tsp_hk(adjMatrix) {
        return heldKarp(adjMatrix);
    }
}

// // generate all sets of possible paths
// // find the cost to go from that set to every possible edge
//
// // helper map to generate all of the possible sets of a given superset
// // https://stackoverflow.com/questions/42773836/how-to-find-all-subsets-of-a-set-in-javascript
// const getAllSubsets = theArray => theArray.reduce((subsets, value) => subsets.concat(subsets.map(set => [value,...set])), [[]] );
// var memory = [];
//
// function genSets(vals) {
//     getAllSubsets(vals);
// }
//
// function heldKarp(adjMatrix) {
//     var cities = [];
//
//     for (var i = 0; i < adjMatrix.length; i++) {
//         cities.push(i);
//     }
//
//     sets = genSets(cities);
//
//     for (set in sets) {
//         for (city in cities) {
//             //if (! (city in set)) {
//                 console.log(city.toString() + ":" + set.toString());
//                 memory[city.toString() + ":" + set.toString()] = getPathCost(city, set, adjMatrix);
//             //}
//         }
//     }
//
//     console.log(getPathCost(0, cities, adjMatrix));
//     return getPathCost(0, cities, adjMatrix);
// }
//
// function getPathCost(city, set, adjMatrix) {
//
//     var distances = [];
//
//     if (set == []){
//         memory[city.toString() + ":[]"];
//         return adjMatrix[0][city];
//     }
//
//     for (var i = 0; i < set.length; i++) {
//         distances.push(adjMatrix[city][set[i]] + getPathCost(set[i], set.filter(c => { return c!= city; }), adjMatrix));
//     }
//     console.log(distances)
//     return Math.min.apply(Math, distances);
// }

// function algorithm TSP (G, n)
//   for k := 2 to n do
//     C({k}, k) := d1,k
//   end for
//
//   for s := 2 to n-1 do
//     for all S ⊆ {2, . . . , n}, |S| = s do
//       for all k ∈ S do
//         C(S, k) := minm≠k,m∈S [C(S\{k}, m) + dm,k]
//       end for
//     end for
//   end for
//
//   opt := mink≠1 [C({2, 3, . . . , n}, k) + dk,1]
//   return (opt)
// end

function heldKarp(adjMatrix) {

}
