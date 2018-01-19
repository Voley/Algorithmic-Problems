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

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    return sumHelper(root, false)
}

func sumHelper(_ root: TreeNode?, _ shouldAdd: Bool) -> Int {
    if root == nil {
        return 0
    }
    if root?.left == nil && root?.right == nil && shouldAdd {
        return root?.val ?? 0
    }
    return sumHelper(root?.left, true) + sumHelper(root?.right, false)
}
