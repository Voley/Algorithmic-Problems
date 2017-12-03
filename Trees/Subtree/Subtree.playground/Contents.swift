/*
 Check Subtree
    T1 and T2 are two very large binary trees, with T1 much bigger than T2. Create an algorithm to determine if T2 is a subtree of T1. A tree T2 is a subtree of T1 if there exists a node n in T1 such that the subtree of n is identical to T2.
 */

class BinaryTreeNode {
    var value: Int
    var isEmpty = false
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    private static let emptyTree = BinaryTreeNode(Int.min)
    class var empty: BinaryTreeNode {
        return emptyTree
    }
    
    init(_ value: Int) {
        self.value = value
    }
}

func isSubtree(_ s: BinaryTreeNode?, _ t: BinaryTreeNode?) -> Bool {
    return traverse(s, t)
}

func traverse(_ first: BinaryTreeNode?, _ second: BinaryTreeNode?) -> Bool {
    return first != nil && (isEqual(first, second) || traverse(first?.left, second) || traverse (first?.right, second))
}

func isEqual(_ first: BinaryTreeNode?, _ second: BinaryTreeNode?) -> Bool {
    if first == nil && second == nil {
        return true
    }
    if first == nil || second == nil {
        return false
    }
    return first?.value == second?.value && isEqual(first?.left, second?.left) && isEqual(first?.right, second?.right)
}

let root = BinaryTreeNode(1)
let l = BinaryTreeNode(2)
let r = BinaryTreeNode(3)
let r2 = BinaryTreeNode(4)

root.left = l
root.right = r
r.right = r2

let separateRoot = BinaryTreeNode(3)
let sr = BinaryTreeNode(4)

separateRoot.right = sr

print("\(isSubtree(root, separateRoot))")

