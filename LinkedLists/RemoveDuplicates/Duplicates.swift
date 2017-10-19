/*
 Rotate Matrix: Given an image represented by a NxN matrix,
 where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees.
 Can you do this in place?
 */

//: Playground - noun: a place where people can play

import Foundation

class Node<T: Hashable> {
    var next: Node<T>?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    // Hash Table O(n^2) worst, O(n) average, O(n) memory
    
    func removeDuplicates() {
        var set: Set<T> = Set()
        var prev = self
        var node: Node<T>? = self
        
        while node != nil {
            guard let confirmedNode = node else { break }
            if set.contains(confirmedNode.value) {
                prev.next = confirmedNode.next
            } else {
                set.insert(confirmedNode.value)
                prev = confirmedNode
            }
            node = confirmedNode.next
        }
    }
    
    // Three pointers O(n^2)
    
    func removeDuplicatesTracing() {
        var current: Node<T>? = self
        var sentinel: Node<T>? = self.next
        
        while current != nil {
            guard let confirmedCurrent = current else { break }
            var previous = confirmedCurrent
            
            while sentinel != nil {
                guard let confirmedRunner = sentinel else { break }
                if confirmedCurrent.value == confirmedRunner.value {
                    previous.next = confirmedRunner.next
                }
                previous = confirmedRunner
                sentinel = confirmedRunner.next
            }
            current = current?.next
            sentinel = current?.next
        }
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
let fourth = Node(1)
let fifth = Node(2)
let sixth = Node(4)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth

first.printList()
first.removeDuplicatesTracing()
first.printList()
