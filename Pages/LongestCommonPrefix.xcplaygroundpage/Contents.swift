//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
struct S1 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // ["flower","flow","flight"]
        if strs.isEmpty {
            return ""
        } else if strs.count == 1 {
            return strs[0]
        }

        var longest = ""
        for i in 1 ..< strs.count {
            let new = common(strs[i], strs[i - 1])
            if i == 1 {
                longest = new
            } else if new.isEmpty {
                return ""
            } else {
                longest = common(new, longest)
            }
        }
        return longest
    }

    func common(_ s1: String, _ s2: String) -> String {
        if s1 == s2 {
            return s1
        }
        let small = Array(s1)

        for i in stride(from: small.count - 1, to: -1, by: -1) {
            let chop = String(small[0 ... i])
            print(chop)
            if s2.hasPrefix(chop) {
                return chop
            }
        }
        return ""
    }
}

struct S2 {
    class Solution {
        func longestCommonPrefix(_ strs: [String]) -> String {
            if strs.isEmpty {
                return ""
            } else if strs.count == 1 {
                return strs[0]
            }
            var high = strs.map { $0.count }.min()!
            var low = 1
            while low <= high {
                let mid = (low + high) / 2
                if common(strs, mid) {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }

            let m = (low + high) / 2
            return String(Array(strs[0])[0 ..< m])
        }

        func common(_ strs: [String], _ count: Int) -> Bool {
            let c = String(Array(strs[0])[0 ..< count])
            return strs.filter { $0.hasPrefix(c) }.count == strs.count
        }
    }
}
