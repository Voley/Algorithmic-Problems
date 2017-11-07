/*
 Random Node
    You are implementing a binary tree class from scratch which, in addition to insert, find and delete, has a method getRandomNode() which returns a random node from the tree. All nodes should be equally likely to be chosen. Design and implement an algorithm to getRandomNode, and explain how you would implement the rest of the methods.
 */

import Foundation

class BinaryTreeNode {
    var value: Int
    var isEmpty = false
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var size: Int = 1
    
    init(_ value: Int) {
        self.value = value
    }
    
    func getRandomNode() -> BinaryTreeNode? {
        let random = Int(arc4random()) % size
        return findNthNode(random)
    }
    
    func insertInOrder(_ value: Int) {
        if value <= self.value {
            if left == nil {
                left = BinaryTreeNode(value)
            } else {
                left?.insertInOrder(value)
            }
        } else {
            if right == nil {
                right = BinaryTreeNode(value)
            } else {
                right?.insertInOrder(value)
            }
        }
        size += 1
    }
    
    private func findNthNode(_ index: Int) -> BinaryTreeNode? {
        let leftSize = left?.size ?? 0
        if index < leftSize {
            return left?.findNthNode(value)
        } else if index == leftSize {
            return self
        } else {
            return right?.findNthNode(index - (leftSize + 1))
        }
    }
}

let root = BinaryTreeNode(1)
root.insertInOrder(2)
root.insertInOrder(3)
root.insertInOrder(4)
root.insertInOrder(5)

print("Got random node: \(root.getRandomNode()!.value)");
print("Got random node: \(root.getRandomNode()!.value)");
print("Got random node: \(root.getRandomNode()!.value)");
print("Got random node: \(root.getRandomNode()!.value)");
print("Got random node: \(root.getRandomNode()!.value)");
print("Got random node: \(root.getRandomNode()!.value)");
print("Got random node: \(root.getRandomNode()!.value)");
