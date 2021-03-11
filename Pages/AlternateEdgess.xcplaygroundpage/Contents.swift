//: [Previous](@previous)

func shortestAlternatingPaths(_ n: Int, _ red_edges: [[Int]], _ blue_edges: [[Int]]) -> [Int] {
    var graph = Array(repeating: [(Int, Int)](), count: n)
    for edge in red_edges {
        graph[edge[0]].append((edge[1], 0))
    }
    for edge in blue_edges {
        graph[edge[0]].append((edge[1], 1))
    }

    var visited = Array(repeating: Array(repeating: false, count: 2), count: n)
    var dist = Array(repeating: Array(repeating: Int.max, count: 2), count: n)
    dist[0][0] = 0
    dist[0][1] = 0
    visited[0][0] = true
    visited[0][1] = true
    var queue = [(Int, Int)]()
    queue.append((0, -1))
    while !queue.isEmpty {
        var curr = queue.removeFirst()
        for p in graph[curr.0] {
            if !visited[p.0][p.1] && p.1 != curr.1 {
                queue.append(p)
                visited[p.0][p.1] = true
                dist[p.0][p.1] = dist[curr.0][p.1 == 1 ? 0 : 1] + 1
            }
        }
    }

    return dist.map{ d in  min(d[0], d[1]) ? == Int.max ? -1 : min(d[0], d[1]) }
//    for d in dist {
//        let finalDist = min(d[0], d[1])
//        if finalDist == Int.max {
//            res.append(-1)
//        } else {
//            res.append(finalDist)
//        }
//    }
//    return res
}
