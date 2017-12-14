/*
   Maximum Depth of Binary Tree
     Given a binary tree, find its maximum depth.
     The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
*/

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

func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    if root?.left == nil && root?.right == nil {
        return 1
    }
    
    let l = maxDepth(root?.left)
    let r = maxDepth(root?.right)
    return 1 + max(l, r)
}
