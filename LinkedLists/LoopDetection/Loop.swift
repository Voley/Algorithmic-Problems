/*
 Loop Detection:
 Given a circular linked list, implement an algorithm that returns the node at the beginning of the loop.
 DEFINITION
 Circular linked list: A (corrupt) linked list in which a node's next pointer points to an earlier node, so as to make a loop in the linked list.
 EXAMPLE
 Input: a-b-c-d-e-c
 Output: c
 */

import Foundation

class Node<T: Hashable & Comparable> : Hashable {
    var next: Node<T>?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    public static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    func hasLoopNode() -> Node? {
        var slow: Node? = self
        var fast: Node? = self
        
        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                break
            }
        }
        
        if slow === fast {
            slow = self
            
            while slow !== fast {
                slow = slow?.next
                fast = fast?.next
            }
            return slow
        }
        return nil
    }
    
    func hasLoopNodeHash() -> Node? {
        var set = Set<Node>()
        var temp: Node? = self
        while let t = temp {
            if set.contains(t) {
                return t
            } else {
                set.insert(t)
            }
            temp = temp?.next
        }
        return nil
    }
    
    static func count(_ first: Node<Int>) -> Int {
        var temp: Node<Int>? = first
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

var first = Node(1)
let second = Node(2)
let third = Node(3)
var fourth = Node(4)
let fifth = Node(5)
let sixth = Node(6)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth
sixth.next = fourth

if let t = first.hasLoopNode() {
    print("Has loop")
    print(t.value)
} else {
    print("Has no loop")
}
