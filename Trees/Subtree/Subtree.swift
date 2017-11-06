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
    
    func containsSubtree(_ node: BinaryTreeNode) -> Bool {
        let candidates = self.sameNodes(to: node)
        for n in candidates {
            if n.isEqual(to: node) {
                return true
            }
        }
        return false
    }
    
    func isEqual(to node: BinaryTreeNode) -> Bool {
        
        if self === BinaryTreeNode.empty && node === BinaryTreeNode.empty {
            return true
        }
        if self.value == node.value {
            let l1 = self.left ?? BinaryTreeNode.empty
            let l2 = node.left ?? BinaryTreeNode.empty
            let r1 = self.right ?? BinaryTreeNode.empty
            let r2 = node.right ?? BinaryTreeNode.empty
            return l1.isEqual(to:l2) && r1.isEqual(to:r2)
        }
        return false
    }
    
    func sameNodes(to node: BinaryTreeNode) -> Array<BinaryTreeNode> {
        let q = Queue<BinaryTreeNode>()
        var result = Array<BinaryTreeNode>()
        q.enqueue(self)
        
        while let el = q.dequeue() {
            if el.value == node.value {
                result.append(el)
            }
            if let l = el.left {
                q.enqueue(l)
            }
            if let r = el.right {
                q.enqueue(r)
            }
        }
        return result
    }
}

// supplementary classes

class Node<T> {
    var next: Node?
    var prev: Node?
    var value: T
    init(_ item: T) {
        value = item
    }
}

class Queue<T> {
    private var first: Node<T>?
    private var last: Node<T>?
    
    func enqueue(_ item: T) {
        let wrap = Node(item)
        if first == nil {
            first = wrap
            last = wrap
        } else {
            last?.prev = wrap
            wrap.next = last
            last = wrap
        }
    }
    
    func dequeue() -> T? {
        if let f = first {
            let temp = f.prev
            temp?.next = nil
            first = temp
            return f.value
        }
        return nil
    }
    
    func peek() -> T? {
        return first?.value
    }
    
    func isEmpty() -> Bool {
        return first == nil
    }
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

print("\(root.containsSubtree(separateRoot))")
