//: [Previous](@previous)
/*
  [[1,2], [1,3], [2,3]]

 graph

  [
 0->
 1-> 2,
 2-> 1
 3->

  ]
  Output: [2,3]

  visited: 1,2,
  */
func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var graph: [[Int]] = Array(repeating: [Int](), count: edges.count + 1)
    for v in edges {
        let i = v[0]
        let j = v[1]
        var visited = Set<Int>()
        /// we check if we can visit the i node in graph without the current edge
        /// if yes: this mean, this is extra edge.
        if canVisitAllNodes(graph, &visited, i, j) {
            return v
        }
        graph[i].append(j)
        graph[j].append(i)
    }
    return []
}

func canVisitAllNodes(_ graph: [[Int]], _ visited: inout Set<Int>, _ node: Int, _ parent: Int) -> Bool {
    if visited.contains(node) {
        return false
    }
    if node == parent {
        print(graph)
        return true
    }
    visited.insert(node)
    for neighbour in graph[node] {
        if canVisitAllNodes(graph, &visited, neighbour, parent) {
            return true
        }
    }
    return false
}

let x = findRedundantConnection([[1, 2], [1, 3], [2, 3]])

var parent: [Int] = []
//[0,1,2,3,4]
func findRedundantConnection1(_ edges: [[Int]]) -> [Int] {
    parent.reserveCapacity(edges.count + 1)
    for i in 0 ... edges.count {
        parent.append(i)
    }

    for edge in edges {
        if find(edge[0]) == find(edge[1]) {
            parent = []
            return edge
        } else {
            parent[find(edge[0])] = find(edge[1])
        }
    }
    return []
}

func find(_ v: Int) -> Int {
    if v == parent[v] {
        return v
    }
    return find(parent[v])
}
