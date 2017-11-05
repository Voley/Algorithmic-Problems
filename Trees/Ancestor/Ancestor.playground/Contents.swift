/*
 First Common Ancestor
 Design an algorithm and write code to find the first common ancestor of two nodes in a binary tree. Avoid storing additional notes in a data structure. NOTE: This is not necessarily a binary search tree.
 */

class TreeNode {
    var links: Array<TreeNode>
    var left: TreeNode?
    var right: TreeNode?
    var parent: TreeNode?
    var value: Int = 0
    init() {
        links = []
    }
    
    func addChild(_ node: TreeNode) {
        links.append(node)
        node.parent = self
    }
    // with link to parent
    
    func commonAncestor(with node: TreeNode) -> TreeNode? {
        let h1 = self.heightToRoot()
        let h2 = node.heightToRoot()
        var node1: TreeNode? = self
        var node2: TreeNode? = node
        
        if h1 > h2 {
            node1 = node1?.progressUpwards(h1 - h2)
        } else if h2 > h1 {
            node2 = node2?.progressUpwards(h2 - h1)
        }
        while node1 !== node2 {
            if node1?.parent == nil || node2?.parent == nil {
                return nil
            }
            node1 = node1?.parent
            node2 = node2?.parent
        }
        return node1 === node2 ? node1 : nil
    }
    
    func heightToRoot() -> Int {
        var temp = self
        var count = 0
        while let p = temp.parent {
            temp = p
            count += 1
        }
        return count
    }
    
    func progressUpwards(_ count: Int) -> TreeNode {
        var temp = self
        for _ in stride(from: 0, to: count, by: 1) {
            if let p = temp.parent {
                temp = p
            } else {
                return temp
            }
        }
        return temp
    }
    
    // without link to parent
    
    class Result {
        var node: TreeNode?
        var isAncestor = false
        init(_ node: TreeNode?, _ ancestor: Bool) {
            self.node = node
            isAncestor = ancestor
        }
    }
    
    func commonAncestor(with node: TreeNode, greatRoot root: TreeNode) -> TreeNode? {
        let r = TreeNode.ancestorHelper(self, node, root)
        if r.isAncestor {
            return r.node
        }
        return nil
    }
    
    static func ancestorHelper(_ first: TreeNode?, _ second: TreeNode?, _ root: TreeNode?) -> Result {
        if root == nil {
            return Result(nil, false)
        }
        
        if root === first && root === second {
            return Result(root, true)
        }
        
        let rLeft = ancestorHelper(first, second, root?.left)
        if rLeft.isAncestor {
            return rLeft
        }
        
        let rRight = ancestorHelper(first, second, root?.right)
        if rRight.isAncestor {
            return rRight
        }
        
        if rLeft.node != nil && rRight.node != nil {
            return Result(root, true)
        } else if root === first || root === second {
            let isAnc = rLeft.node != nil || rRight.node != nil
            return Result(root, isAnc)
        } else {
            return Result(rLeft.node != nil ? rLeft.node : rRight.node, false)
        }
    }
}

var z = TreeNode()
z.value = 10
var l1 = TreeNode()
var l2 = TreeNode()
var l3 = TreeNode()
var r1 = TreeNode()
var r2 = TreeNode()
var r3 = TreeNode()

z.addChild(l1)
z.addChild(r1)
r1.addChild(r2)
r2.addChild(r3)
l1.addChild(l2)
l2.addChild(l3)

z.left = l1
z.right = r1
r1.left = r2
r2.left = r3
l1.right = l2
l2.left = l3

print(r3.commonAncestor(with: l3)?.value ?? "Not Found")
let result = r3.commonAncestor(with: l3, greatRoot: z)
print(result?.value ?? "Not found")
