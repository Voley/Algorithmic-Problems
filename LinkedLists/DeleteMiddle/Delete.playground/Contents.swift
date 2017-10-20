/*
 Delete Middle Node:
     Implement an algorithm to delete a node in the middle
     (i.e. any node but the first and last node, not necessarily the exact middle)
     of a singly linked list, given only access to that node
 
 Example:
     Input: node c from a-b-c-d-e-f
     Result: nothing is returned, but the new linked list looks like a-b-d-e-f
*/

import Foundation

class Node<T: Hashable> {
    var next: Node<T>?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    func deleteMiddleNode() {
        guard let nextNode = next else { return }
        next = nextNode.next
        value = nextNode.value
    }
    
    func printList() {
        var temp: Node<T>? = self
        print("List: ", terminator: "");
        while temp != nil {
            guard let confirmedNode = temp else { break }
            print(confirmedNode.value, terminator: " ")
            temp = temp?.next
        }
        print("", terminator: "\n")
    }
}

let first = Node(1)
let second = Node(2)
let third = Node(3)

first.next = second
second.next = third

first.printList()
print("Deleting node")
second.deleteMiddleNode()
first.printList()
