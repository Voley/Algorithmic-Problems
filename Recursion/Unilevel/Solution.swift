/*
   Longest Univalue Path
     Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.
 
     Note: The length of path between two nodes is represented by the number of edges between them.
 */

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    if let node = root {
        let sub = max(longestUnivaluePath(node.left), longestUnivaluePath(node.right))
        return max(sub, helper(node.left, node.val) + helper(node.right, node.val))
    }
    return 0
}

func helper(_ node: TreeNode?, _ value: Int) -> Int {
    if let root = node {
        if root.val != value {
            return 0
        }
        return 1 + max(helper(root.left, value), helper(root.right, value))
    }
    return 0
}

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

