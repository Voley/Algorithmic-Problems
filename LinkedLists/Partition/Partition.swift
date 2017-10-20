/*
 Partition:
 Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. If x is contained within the list, the values of x only need to be after the elements less than x (see below). The partition element x can appear anywhere in the “right partition”; it does not need to appear between the left and right partitions.
 
 Example
 Input: 3-5-8-5-10-2-1 [partition = 5]
 Output: 3-1-2-10-5-5-8
 */

import Foundation

class Node<T: Hashable & Comparable> {
    var next: Node<T>?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    func partition(_ around: T, _ node: Node<T>) -> Node<T> {
        var head = node
        var tail = node
        var current: Node<T>? = node
        
        while let temp = current {
            let next = temp.next
            if temp.value < around {
                temp.next = head
                head = temp
            } else {
                tail.next = temp
                tail = temp
            }
            current = next
        }
        tail.next = nil
        return head
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

var first = Node(7)
let second = Node(6)
let third = Node(5)
let fourth = Node(4)
let fifth = Node(3)
let sixth = Node(2)
let seventh = Node(1)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth
sixth.next = seventh

first.printList()
first = first.partition(3, first)
first.printList()
