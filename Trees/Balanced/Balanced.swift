/*
 Check Balanced
    Implement a function to check if a binary tree is balanced. For the purposes of this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node never differ by more than one.
 */

class BinaryTreeNode<T> {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var value: T
    
    init(_ item: T) {
        value = item
    }
    
    func checkBalanced() -> Bool {
        return heightHelper() != -1;
    }
    
    private func heightHelper() -> Int {
        var leftHeight = 0
        var rightHeight = 0
        
        if let l = left {
            leftHeight = l.heightHelper()
        }
        if let r = right {
            rightHeight = r.heightHelper()
        }
        
        if leftHeight == -1 || rightHeight == -1 {
            return -1
        }
        
        if abs(leftHeight - rightHeight) <= 1 {
            return max(leftHeight, rightHeight) + 1
        }
        return -1
    }
}

let root = BinaryTreeNode(0)
let left = BinaryTreeNode(1)
let left2 = BinaryTreeNode(2)
root.left = left
left.left = left2
//root.right = left2

print(root.checkBalanced())

