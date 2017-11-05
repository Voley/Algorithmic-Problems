/*
 BST Sequences
     A binary search tree was created by traversing through an array from left to right and inserting each element. Given a binary search tree with distinct elements, print all possible arrays that could have led to this tree.
 EXAMPLE
 ....2
 ..1...3
 Output: {2, 1, 3}, {2, 3, 1}
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
    
    func sequences(_ tree: TreeNode) -> Array<Array<Int>> {
        return innerSequences([tree])
    }
    
    private func innerSequences(_ roots: Array<TreeNode>) -> Array<Array<Int>> {
        var output = Array<Array<Int>>()
        
        for i in roots.indices {
            var choices = roots
            let root = choices.remove(at: i)
            choices.append(contentsOf: root.links)
            
            if choices.count > 0 {
                for s in innerSequences(choices) {
                    output.append([root.value] + s)
                }
            } else {
                output.append([root.value]) // end recursion
            }
        }
        return output
    }
}

var z = TreeNode()
z.value = 1
var l1 = TreeNode()
l1.value = 2
var l2 = TreeNode()
l2.value = 3
var l3 = TreeNode()
l3.value = 4

z.addChild(l1)
z.addChild(l2)
l2.addChild(l3)

print(z.sequences(z))

