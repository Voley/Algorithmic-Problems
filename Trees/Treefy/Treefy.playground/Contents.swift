/*
 Minimal Tree:
 Given a sorted array with unique integer elements, write an algorithm to create a binary search tree with minimal height
 */

import Foundation

class Node<T> {
    var left: Node?
    var right: Node?
    var value: T
    init(_ item: T) {
        value = item
    }
    
    static func treefy (_ array: Array<Node>, _ start: Int, _ end: Int) -> Node? {
        if start > end {
            return nil
        }
        
        let mid = (start + end) / 2
        let root = Node(array[mid].value)
        root.left = treefy(array, start, mid - 1)
        root.right = treefy(array, mid + 1, end)
        return root
    }
}

let array = [Node(1), Node(2), Node(3), Node(4), Node(5)]
let tree = Node.treefy(array, 0, (array.count - 1))
