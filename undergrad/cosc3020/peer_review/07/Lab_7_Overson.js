/*
The time complexity will be O((V + E) * logV)

Sources used: 
https://medium.com/@adriennetjohnson/a-walkthrough-of-dijkstras-algorithm-in-javascript-e94b74192026
https://www.tutorialspoint.com/Dijkstra-s-algorithm-in-Javascript
*/

test();
function test() {

  var adjList = {
      start: {a: 5, b: 5, c: 6},
      a: {b: 3, d: 5, end: 7},
      b: {d: 4},
      c: {b: 2, d: 7},
      d: {end: 3},
      end: {}
  }
  var adjList2 = {
    start: {a: 4, b: 8},
    a: {b: 7, c: 6},
    b: {c: 5, d: 4},
    c: {b: 3, end: 5},
    d: {end: 3},
    end: {}
  }
  console.log(dijkstra(adjList));
  console.log(dijkstra(adjList2));
}
 
function dijkstra(graph) {
  
  var costs = Object.assign({end: Infinity}, graph.start);
  var parents = {end: null};

  for (let child in graph.start) {
    parents[child] = "start";
  }
  
  var processed = [];
  let node = lowestCostNode(costs, processed);
  
  while (node) {
    let cost = costs[node];
    let children = graph[node];
    for (let n in children) {
      let newCost = cost + children[n];
      if (!costs[n]) {
        costs[n] = newCost;
        parents[n] = node;
      }
      if (costs[n] > newCost) {
        costs[n] = newCost;
        parents[n] = node;
      }
    }
    processed.push(node);
    node = lowestCostNode(costs, processed);
  }
  
  var rightPath = ["end"];
  var parent = parents.end;
  while (parent) {
    rightPath.push(parent);
    parent = parents[parent];
  }
  rightPath.reverse();
  
  var results = {
    cost: costs.end,
    path: rightPath
  }
  
  return results;
}
function lowestCostNode(costs, processed) {
  return Object.keys(costs).reduce((lowest, node) => {
    if (lowest === null || costs[node] < costs[lowest]) {
      if (!processed.includes(node)) {
        lowest = node;
      }
    }
    return lowest;
  }, null);
}
  
  

