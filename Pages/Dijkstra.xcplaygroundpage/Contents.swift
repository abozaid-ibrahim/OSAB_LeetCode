//: [Previous](@previous)


import Foundation
class Solution {
    // [[0,1,3],[1,2,1],   [1,3,4],    [2,3,1]]
    //
    typealias Node = (Int, Int)
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var mn = Int.max
        var count = Int.max

        // convert to graph of nodes
        var graph: [[Node]] = Array(repeating: [Node](), count: n)
        graph.reserveCapacity(n + 1)

        for edge in edges {
            let ch1 = edge[0]
            let ch2 = edge[1]
            let w = edge[2]
            graph[ch1].append((ch2, w))
            graph[ch2].append((ch1, w))
        }

        // get every single node visited cities

        // filter to return the minimuim
        for city in 0..<n {
            let result = citiesCanVisit(city, graph, distanceThreshold)
            if result.count <= count {
                mn = city
                count = result.count
            }
        }

        return mn
    }

    // graph-> [0] = 1;
    func citiesCanVisit(_ i: Int, _ nodes: [[Node]], _ steps: Int) -> [Int] {
        var visited = Set<Int>()
        var queue: [Node] = [(i, steps)] // add the current index as start of my queue

        while queue.count > 0 {
            let index = queue.removeLast() // n,w
            let childs = nodes[index.0] // [nodes]
            var sum = index.1
            for nd in childs {
                if visited.contains(nd.0) { continue }
                let rest = sum - nd.1
                visited.insert(nd.0)
                guard rest >= 0 else {
                    continue
                }

                queue.append((nd.0, sum - nd.1))
            }
        }

        return Array(visited)
    }
}

Solution().findTheCity(5, [[0, 1, 2], [0, 4, 8], [1, 2, 3], [1, 4, 2], [2, 3, 1], [3, 4, 1]], 2)
