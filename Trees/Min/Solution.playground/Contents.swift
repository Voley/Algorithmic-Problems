public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func minDepth(_ root: TreeNode?) -> Int {
    return depthHelper(1, root)
}

func depthHelper(_ depth: Int, _ node: TreeNode?) -> Int {
    if (node == nil) {
        return 0
    }
    if node?.left != nil && node?.right != nil {
        return min(depthHelper(depth, node?.left), depthHelper(depth, node?.right)) + 1
    } else {
        return max(depthHelper(depth, node?.left), depthHelper(depth, node?.right)) + 1
    }
}
