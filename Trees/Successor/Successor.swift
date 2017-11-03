/*
 Successor
     Write an algorithm to find the "next" node (i.e. in-order successor) of a given node in a binary search tree. You may assume that each node has a link to its parent
*/

class BinaryTreeNode {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var parent: BinaryTreeNode?
    var value: Int
    
    init(_ item: Int) {
        value = item
    }
    
    func successor() -> BinaryTreeNode {
        if right != nil {
            return minValue()
        }
        var p: BinaryTreeNode? = self.parent
        var n: BinaryTreeNode? = self
        while p != nil && self === p?.right {
            n = p
            p = p?.parent
        }
        
        return p ?? self
    }
    
    func minValue() -> BinaryTreeNode {
        var temp = self
        while let l = temp.left {
            temp = l
        }
        return temp
    }
}
