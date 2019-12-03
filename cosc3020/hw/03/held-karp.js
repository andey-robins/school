var distances = []

module.exports = {
    tsp_hk: function tsp_hk(adjMatrix) {
        distances = adjMatrix

        if (adjMatrix.length <= 1) {
            return 0;
        }

        cities = [];
        for (var i = 0; i < adjMatrix.length; i++) {
            cities.push(i);
        }

        options = [];
        for (city in cities) {
            options.push(heldKarp(cities.filter(c => c != city), city, "\t"));
            console.log(options);
        }

        return Math.min.apply(null, options);
    }
}

/*
heldKarp(cities, start)
    if |cities| == 2:
        return distance from start to other city in cities
    else
        return min(
            for each city in cities : city != start:
                heldKarp(cities - start, city) + distance from start to city
                    )
*/

memories = {}

function heldKarp(cities, start, s) {
    //console.log(s + start.toString() + ":" + cities.toString());
    if (cities.length == 2) {
        // first check which city isn't the starting city, then checks to see if a path between the two is defined
        // then returns that path's cost or the max_value as a failure value.
        if (cities[0] == start) {
                return distances[start][cities[1]];
        } else {
                return distances[start][cities[0]];
        }
    } else {
        options = []

        // recursively calculate the n-1 sized traversals using memories to store value as they go.
        for (var i = 0; i < cities.length; i++) {
            calc = -1;
            if (cities[i] != start) {
                calc = heldKarp(cities.filter(c => c != start), cities[i], s + "\t");
                calc += distances[start][cities[i]];
                options.push(calc);
            }
        }
        // for (city in cities) {
        //     if (city != start) {
        //         options.push(heldKarp(cities.filter(c => c != start), city, "\t") + distances[start][city]);
        //     }
        // }
        //console.log(s + start.toString() + ":" + cities.toString() + ":" + options.toString());

        //console.log(options);
        return Math.min.apply(null, options);
    }

}
distances = [[0, 2], [0, 0]];
console.log(heldKarp([0, 1], 0, ""));
//console.log(tsp_hk(distance));
