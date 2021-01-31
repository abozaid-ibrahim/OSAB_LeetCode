// #617
func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    let x = min(rec1[0], rec1[2]) ... max(rec1[0], rec1[2])
    let y = min(rec1[1], rec1[3]) ... max(rec1[1], rec1[3])
    let x2 = min(rec2[0], rec2[2]) ... max(rec2[0], rec2[2])
    let y2 = min(rec2[1], rec2[3]) ... max(rec2[1], rec2[3])
    return inter(x2, x) || inter(y, y2)
}

func inter(_ a: CountableClosedRange<Int>, _ b: CountableClosedRange<Int>) -> Bool {
    for i in b {
        for j in a {
            if i == j {
                return true
            }
        }
    }
    return false
}

func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    if t1 == nil {
        return t2
    }
    if t2 == nil {
        return t1
    }

    let val = t1!.val + t2!.val
    let node = TreeNode(val)
    node.left = mergeTrees(t1?.left, t2?.left)
    node.right = mergeTrees(t1?.right, t2?.right)
    // Space:  O(N+M), n first tree count, m is second tree count
    // Time: O(M+N)
    return node
}

mergeTrees(nil, nil)
