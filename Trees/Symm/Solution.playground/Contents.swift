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

func isSymmetric(_ root: TreeNode?) -> Bool {
    return helper(root, root)
}

func helper(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
    guard let l = left else { return right == nil }
    guard let r = right else { return left == nil }
    return l.val == r.val && helper(l.left, r.right) && helper(l.right, r.left)
}
