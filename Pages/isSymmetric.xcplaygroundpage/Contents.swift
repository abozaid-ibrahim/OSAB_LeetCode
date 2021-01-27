//: [Previous](@previous)

import Foundation
func isSymmetric(_ root: TreeNode?) -> Bool {
    var stack: [TreeNode?] = []
    stack.append(root)
    stack.append(root)
    while !stack.isEmpty {
        let left = stack.popLast()!
        let right = stack.popLast()!
        if left == nil && right == nil { continue }
        if left == nil || right == nil { return false }
        if left?.val != right?.val { return false }
        stack.append(left?.left)
        stack.append(right?.right)
        stack.append(left?.right)
        stack.append(right?.left)
    }
    return true
}
