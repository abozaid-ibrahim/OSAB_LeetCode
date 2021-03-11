//: [Previous](@previous)

import Foundation
func missingNumber(_ nums: [Int]) -> Int {
    var result = nums.count
    for i in 0 ..< nums.count {
        result ^= i ^ nums[i]
    }
    return result
}
