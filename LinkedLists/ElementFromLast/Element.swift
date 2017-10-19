/*
 Return Kth to Last:
 Implement an algorithm to find the kth to last element of a singly linked list
 */

import Foundation

class Node<T: Hashable> {
    var next: Node<T>?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    func elementAt(_ index: Int) -> Node<T>? {
        var size = 0
        var node: Node<T>? = self
        while node != nil {
            node = node?.next
            size += 1
        }
        
        var counter = size - index
        node = self
        while counter != 0 {
            node = node?.next
            counter -= 1
        }
        return node
    }
    
    func printList() {
        var temp: Node<T>? = self
        print("Printing list: ");
        while temp != nil {
            guard let confirmedNode = temp else { break }
            print(confirmedNode.value)
            temp = temp?.next
        }
        print("Ended list.")
    }
}

let first = Node(1)
let second = Node(2)
let third = Node(3)
let fourth = Node(4)
let fifth = Node(5)
let sixth = Node(6)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth

first.printList()

print("Printing element at index 3 from end:")

if let element = first.elementAt(3) {
    print(element.value)
}
