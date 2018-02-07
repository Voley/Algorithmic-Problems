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

func getMinimumDifference(_ root: TreeNode?) -> Int {
    
    var prev: TreeNode?
    var diff = Int.max
    inOrderVisit(root, &prev, &diff)
    return diff
}

func inOrderVisit(_ root: TreeNode?, _ prev: inout TreeNode?, _ diff: inout Int) {
    if let node = root {
        inOrderVisit(node.left, &prev, &diff)
        if let p = prev {
            diff = min(diff, node.val - p.val)
        }
        prev = node
        inOrderVisit(node.right, &prev, &diff)
    }
}

