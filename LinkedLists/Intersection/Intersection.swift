/*
 Intersection:
 Given two (singly) linked lists, determine of the two lists intersect. Return the intersecting node. Note that the intersection is defined based on reference, not value. That is, if the kth node of the first linked list is the exact same node(by reference) as the jth node of the second linked list, then they are intersecting.
 */

import Foundation

class Node<T: Hashable & Comparable> {
    var next: Node<T>?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    func intersectingNode(_ with: Node) -> Node? {
        
        // count first list, remember last node
        let r1 = self.lengthWithLastNode()
        let last1 = r1.node
        let count1 = r1.count
        
        // count second list, remember last node
        let r2 = with.lengthWithLastNode()
        let last2 = r2.node
        let count2 = r2.count
        
        // if last nodes do not match, they do not intersect
        if last1 !== last2 {
            return nil
        }
        
        var temp1: Node<T>? = self
        var temp2: Node<T>? = with
        
        // move both list to same position
        if count1 > count2 {
            temp1 = temp1?.advanceNode(count1 - count2)
        } else if count2 > count1 {
            temp2 = temp2?.advanceNode(count2 - count1)
        }
        
        // iterate over list, look for the first common node
        while temp1 != nil {
            if temp1 === temp2 {
                return temp1
            }
            temp1 = temp1?.next
            temp2 = temp2?.next
        }
        return nil
    }
    
    func advanceNode(_ by: Int) -> Node? {
        var temp: Node? = self
        var counter = by
        while counter > 0 {
            temp = temp?.next
            counter -= 1
        }
        return temp
    }
    
    func lengthWithLastNode() -> (node: Node?, count: Int) {
        var count = 1
        var temp: Node? = self
        while temp?.next != nil {
            count += 1
            temp = temp?.next
        }
        return (temp, count)
    }
    
    func count() -> Int {
        var temp: Node? = self
        var count = 0
        while temp != nil {
            temp = temp?.next
            count += 1
        }
        return count
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

var first = Node(9)
let second = Node(9)
let third = Node(9)

var fourth = Node(3)
let fifth = Node(2)
let sixth = Node(1)

first.next = second
second.next = third
third.next = fifth

fourth.next = fifth
fifth.next = sixth

first.printList()
fourth.printList()

if let value = first.intersectingNode(fourth) {
    print("We have intersection at value \(value.value)")
} else {
    print("No intersection")
}


