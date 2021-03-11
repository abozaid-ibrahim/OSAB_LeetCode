//: [Previous](@previous)

import Foundation

var targets = [String: [String]]()
var route = [String]()

func findItinerary(_ tickets: [[String]]) -> [String] {
    for ticket in tickets {
        if targets[ticket[0]] == nil {
            targets[ticket[0]] = [ticket[1]]
        } else {
            targets[ticket[0]]!.append(ticket[1])
        }
    }
    // [S->  [Distinations]]
    for ticket in tickets {
        targets[ticket[0]] = targets[ticket[0]]!.sorted()
    }
    print(targets)
    visit("JFK")
    return route.reversed()
}

func visit(_ airport: String) {
    guard targets[airport] != nil else {
        /// this is the final destination.
        route.append(airport)
        return
    }
    while targets[airport]!.count > 0 {
        if let next = targets[airport]!.first {
            targets[airport]!.removeFirst()
            visit(next)
        }
    }

    route.append(airport)
}

findItinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]])

//: [Next](@next)
