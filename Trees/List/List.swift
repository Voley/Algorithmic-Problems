/*
 List of depths:
     Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g. if you have a tree with depth D, you'll have D linked lists)
 */

class SinglyListNode<T> {
    var next: SinglyListNode?
    var value: T
    
    init(_ item: T) {
        value = item
    }
    
    func lastNode() -> SinglyListNode {
        var temp = self
        while let next = temp.next {
            temp = next
        }
        return temp
    }
    
    func printList() {
        var temp = self
        
        var result = ""
        result.append("\(value) ")
        
        while let next = temp.next {
            result.append("\(next.value) ")
            temp = next
        }
        print(result)
    }
}

class BinaryTreeNode<T> {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var value: T
    
    init(_ item: T) {
        value = item
    }
    
    func toLists() -> Array<SinglyListNode<T>> {
        var result = Array<SinglyListNode<T>>()
        innerToLists(0, self, &result)
        return result
    }
    
    private func innerToLists(_ level: Int, _ node: BinaryTreeNode<T>, _ array: inout Array<SinglyListNode<T>>) {
        
        let listNode = SinglyListNode(node.value)
        
        if array.count < level + 1  {
            array.append(listNode)
        } else {
            let n = array[level].lastNode()
            n.next = SinglyListNode(node.value)
        }
        
        if let left = node.left {
            innerToLists(level + 1, left, &array)
        }
        
        if let right = node.right {
            innerToLists(level + 1, right, &array)
        }
    }
}

let root = BinaryTreeNode(0)
let left = BinaryTreeNode(10)
let right = BinaryTreeNode(11)
let leftleft = BinaryTreeNode(20)
let leftright = BinaryTreeNode(21)
let rightright = BinaryTreeNode(22)
let leftleftleft = BinaryTreeNode(30)
let rightrightright = BinaryTreeNode(31)

rightright.right = rightrightright
leftleft.left = leftleftleft
left.left = leftleft
left.right = leftright
right.right = rightright
root.left = left
root.right = right

let arr = root.toLists()
arr[0].printList()
arr[1].printList()
arr[2].printList()
arr[3].printList()
