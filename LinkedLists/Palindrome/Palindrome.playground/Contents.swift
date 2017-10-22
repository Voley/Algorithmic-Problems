/*
 Palindrome:
 Implement a function to check if a linked list is a palindrome
 */

import Foundation

class Node<T: Hashable & Comparable> {
    var next: Node<T>?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    func isPalindrome() -> Bool {
        let count = self.count()
        let midpoint = count / 2
        let offset = count % 2
        
        var temp: Node<T>? = self
        for _ in stride(from: 0, to: midpoint + offset, by: 1) {
            temp = temp?.next
        }
        
        var copy: Node<T>? = temp?.reversedCopy()
        temp = self
        for _ in stride(from: 0, to: midpoint, by: 1) {
            if temp?.value != copy?.value {
                return false
            }
            temp = temp?.next;
            copy = copy?.next;
        }
        return true
    }
    
    func reversedCopy() -> Node<T>? {
        var newHead: Node<T>?
        var temp: Node<T>? = self
        while let t = temp {
            let n1 = Node(t.value)
            if newHead == nil {
                newHead = n1
            } else {
                n1.next = newHead
                newHead = n1
            }
            temp = t.next
        }
        return newHead
    }
    
    func count() -> Int {
        var temp: Node<T>? = self
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
var fourth = Node(3)
let fifth = Node(2)
let sixth = Node(1)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth

first.printList()

print(first.isPalindrome())
