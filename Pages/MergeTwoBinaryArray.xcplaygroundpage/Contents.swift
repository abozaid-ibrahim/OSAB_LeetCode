// #617

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
