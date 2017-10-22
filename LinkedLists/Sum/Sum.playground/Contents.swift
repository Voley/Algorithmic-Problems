/*
 Sum Lists:
 You have two numbers represented by a linked list, where each node contains a single digit. The digits are stored in reverse order, such that the 1's digit is at the head of the list. Write a function that adds the two numbers and returns the sum as a linked list.
 
 Example:
 Input: 7-1-6 + 5-9-2, that is 617 + 295
 Output: 2-1-9, that is 912
 
 Follow up:
 Suppose the digits are stored in forward order. Repeat the above problem.
 Example:
 Input: 6-1-7 + 2-9-5, that is 617 + 295
 Output: 9-1-2, that is 912
 */

import Foundation

class Node<T: Hashable & Comparable> {
    var next: Node<T>?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    func addLists(_ first: Node<Int>?, _ second: Node<Int>?, _ carry: Int) -> Node<Int>? {
        
        if first == nil && second == nil && carry == 0 {
            return nil
        }
        
        let result = Node<Int>(0)
        var value = carry
        
        if let first = first {
            value += first.value
        }
        
        if let second = second {
            value += second.value
        }
        
        result.value = value % 10
        let carryOver = value / 10
        
        if first != nil || second != nil {
            let more = addLists(first?.next, second?.next, carryOver)
            result.next = more
        }
        return result
    }
    
    func addForwardLists(_ first: Node<Int>, _ second: Node<Int>) -> Node<Int>? {
        let n1Count = Node.count(first)
        let n2Count = Node.count(second)
        
        var n1Padded = first
        var n2Padded = second
        
        if n1Count > n2Count {
            n2Padded = padWithZeroes(n1Count - n2Count)
        } else if n2Count > n1Count {
            n1Padded = padWithZeroes(n2Count - n1Count)
        }
        
        addSameSize(n1Padded, n2Padded)
        
        if carry != 0 {
            prependToResult(carry)
        }
        return result
    }
    
    var carry = 0;
    var result: Node<Int>?
    
    private func addSameSize(_ first: Node<Int>?, _ second: Node<Int>?) {
        
        if first == nil {
            return
        }
        
        addSameSize(first?.next, second?.next)
        
        guard let c1 = first else { return }
        guard let c2 = second else { return }
        
        var value = c1.value + c2.value + carry
        carry = value / 10
        value = value % 10
        
        prependToResult(value)
    }
    
    private func prependToResult(_ value: Int) {
        let node = Node<Int>(value)
        node.next = result
        result = node
    }
    
    private func padWithZeroes(_ count: Int) -> Node<Int> {
        return Node<Int>(0)
    }
    
    func rotateList(_ node: Node<T>) -> Node<T> {
        var prev: Node<T>? = nil
        var temp: Node<T>? = node
        
        while temp != nil {
            let next: Node<T>? = temp?.next
            temp?.next = prev
            prev = temp
            temp = next
        }
        return prev!
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

var first = Node(9)
let second = Node(9)
let third = Node(9)

var fourth = Node(3)
let fifth = Node(2)
let sixth = Node(1)

first.next = second
second.next = third

fourth.next = fifth
fifth.next = sixth

first.printList()
fourth.printList()

let result = first.addForwardLists(first, fourth)
result!.printList()
