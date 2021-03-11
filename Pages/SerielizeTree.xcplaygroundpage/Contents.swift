//: [Previous](@previous)

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    var arr: [Int?] = []
    func serialize(_ root: TreeNode?) -> String {
        guard let n = root else { return "" }
        dfs(n)
        return arr.map{ $0 == nil ? "" : "\($0!)"}.joined(separator: ",")
    }

    func dfs(_ n: TreeNode?) {
        arr.append(n?.val)
        if let lft = n?.left {
            arr.append(dfs(lft))
        } else {
            arr.append(nil)
        }
        if let right = n?.right {
            arr.append(dfs(right))
        } else {
            arr.append(nil)
        }
    }

    func p(_ i: Int) -> Int {
        return (i - 1) / 2
    }

    func l(_ i: Int) -> Int {
        return i / 2 + 1
    }

    func r(_ i: Int) -> Int {
        return i / 2 + 2
    }

    func deserialize(_ data: String) -> TreeNode? {
        let arr = data.split(by: ",")
        var head = build(0, arr)
        return head
    }

    func build(_ i: Int, _ arr: [Int]) -> TreeNode? {
        guard i < arr.count else { return nil }
        var node = TreeNode(arr[i])
        node.left = build(l(i),arr)
        node.right = build(r(i),arr)
        return node
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))

//: [Next](@next)
Codec().serialize(nil)
