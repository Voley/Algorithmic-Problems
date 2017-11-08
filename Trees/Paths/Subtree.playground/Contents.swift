/*
 Paths with Sum
 You are given a binary tree in which each node contains an integer value (which might be positive or negative). Design an algorithm to count the number of paths that sum to a given value. The path does not need to start or end at the root or a leaf, but it must go downwards(traveling only from parent nodes to child nodes).
 */

class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func numberOfPathsFor(_ sum: Int) -> Int {
        var pathCount = Dictionary<Int, Int>()
        return paths(sum, 0, &pathCount)
    }
    
    private func paths(_ target: Int, _ runningSum: Int, _ pathCount: inout Dictionary<Int, Int>) -> Int {
        
        let rs = runningSum + value
        let s = rs - target
        
        var totalPaths = pathCount[s] ?? 0
        
        if rs == target {
            totalPaths += 1
        }
        incrementHashTable(&pathCount, rs, 1)
        
        if let l = left {
            totalPaths += l.paths(target, rs, &pathCount)
        }
        
        if let r = right {
            totalPaths += r.paths(target, rs, &pathCount)
        }
        
        incrementHashTable(&pathCount, rs, -1)
        
        return totalPaths
    }
    
    private func incrementHashTable(_ pathCount: inout Dictionary<Int, Int>, _ runningSum: Int, _ delta: Int) {
        if var value = pathCount[runningSum] {
            value += delta
            pathCount[runningSum] = value
        } else if delta > 0 {
            pathCount[runningSum] = delta
        }
    }
    
}

/*
         1
      /     \
   2         5
 /  \       / \
1    -1    -1  -2
      \         \
       2        10
*/

let root = BinaryTreeNode(1)
let l = BinaryTreeNode(2)
let r = BinaryTreeNode(5)
let l1 = BinaryTreeNode(1)
let l2 = BinaryTreeNode(-1)
let l3 = BinaryTreeNode(2)
let r1 = BinaryTreeNode(-1)
let r2 = BinaryTreeNode(-2)
let r3 = BinaryTreeNode(10)

root.left = l
root.right = r
l.left = l1
l.right = l2
l2.right = l3
r.left = r1
r.right = r2
r2.right = r3

let mroot = BinaryTreeNode(1)
let ml = BinaryTreeNode(2)
let mr = BinaryTreeNode(4)
mroot.left = ml
mroot.right = mr

print(root.numberOfPathsFor(4))
print(mroot.numberOfPathsFor(3))
