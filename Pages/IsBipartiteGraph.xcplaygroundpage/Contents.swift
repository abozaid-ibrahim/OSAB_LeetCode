//: [Previous](@previous)

import Foundation
var visited = Set<Int>()

func isBipartite(_ graph: [[Int]]) -> Bool {
    for offset in 0 ..< graph.count {
        dfs(graph, vertex: offset) ? continue : return false
    }

    return true
}

private func dfs(_ graph: [[Int]], vertex: Int, subset1: [Int] = [], subset2: [Int] = []) -> Bool {
    guard !subset2.contains(vertex) else { return false }
    guard visited.insert(vertex).inserted else { return true }

    return graph[vertex].first { !dfs(graph, vertex: $0, subset1: subset2, subset2: subset1 + [vertex]) } == nil
}

func isBipartite(_ graph: [[Int]]) -> Bool {
    var colored = [Int](repeating: 0, count: graph.count)
    for i in 0 ..< graph.count {
        guard colored[i] == 0 else { continue }
        var stack = [i]
        colored[i] = 1
        while !stack.isEmpty {
            let parent = stack.removeLast()
            for nb in graph[parent] {
                if colored[nb] == 0 {
                    stack.append(nb)
                    colored[nb] = colored[parent] * (-1)
                } else if colored[nb] == colored[parent] {
                    return false
                }
            }
        }
    }
    return true
}
