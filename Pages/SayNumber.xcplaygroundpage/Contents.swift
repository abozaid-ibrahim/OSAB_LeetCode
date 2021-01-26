//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }

        var result = "1"
        for _ in 2 ... n {
            var say = ""
            var digit = ""
            var counter = 0
            for ch in result {
                let d = String(ch)
                if digit.isEmpty {
                    digit = d
                    counter += 1
                } else if digit == d {
                    counter += 1
                } else {
                    say += "\(counter)\(digit)"
                    counter = 1
                    digit = d
                }
            }
            say += "\(counter)\(digit)"
            result = say
        }

        return result
    }
}
