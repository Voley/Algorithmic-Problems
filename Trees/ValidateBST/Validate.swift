/*
 Validate Binary Search Tree
     Implement a function to check if a binary tree is binary search tree
*/

class BinaryTreeNode {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var value: Int
    
    init(_ item: Int) {
        value = item
    }
    
    private func innerCheckBST(_ min: Int, _ max: Int) -> Bool {
        if value < min || value > max {
            return false
        }
        return left?.innerCheckBST(min, value) ?? true && right?.innerCheckBST(value, max) ?? true
    }
    
    func validateBST() -> Bool {
        return innerCheckBST(Int.min, Int.max)
    }
}

let r1 = BinaryTreeNode(20)
let r2 = BinaryTreeNode(10)
let r3 = BinaryTreeNode(30)
let r4 = BinaryTreeNode(25)

r1.left = r2
r1.right = r3
r2.right = r4

print(r1.validateBST())
