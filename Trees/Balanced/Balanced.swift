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
    
    func innerDepths(_ array: inout Array<Int>, _ currentDepth: Int) {
        if left == nil || right == nil {
            array.append(currentDepth)
        }
        
        if let l = left {
            l.innerDepths(&array, currentDepth + 1)
        }
        if let r = right {
            r.innerDepths(&array, currentDepth + 1)
        }
    }
    
    func checkBalanced() -> Bool {
        var array = Array<Int>()
        innerDepths(&array, 0)
        var min = Int.max
        var max = Int.min
        for i in array {
            if i < min {
                min = i
            }
            if i > max {
                max = i
            }
        }
        
        print(array)
        
        if (max - min) > 1 {
            return false
        }
        return true
    }
}

let root2 = BinaryTreeNode(0)
let left2 = BinaryTreeNode(1)
let left3 = BinaryTreeNode(2)
root2.left = left2
left2.left = left3

let root = BinaryTreeNode(0)
let left = BinaryTreeNode(1)
let right = BinaryTreeNode(2)
root.left = left
root.right = right
root.right?.right = left3

print(root2.checkBalanced())
print(root.checkBalanced())
