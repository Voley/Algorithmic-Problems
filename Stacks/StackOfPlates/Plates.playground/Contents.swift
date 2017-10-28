
/*
 Stack of Plates:
 Imagine a (literal) stack of plates. If the stack gets too high, it might topple. Therefore, in real life, we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure SetOfStacks that mimics this. SetOfStacks should be composed of several stacks and should create a new stack once a previous one exceeds capacity.
 SetOfStacks.push() and SetOfStacks.pop() should behave identically to a singles stack (that is, pop() should return the same values as it would if there just a single stack).
 */

import Foundation

class SetOfStacks<T> {
    
    var first: Stack<T>?
    var last: Stack<T>?
    var singleStackCapacity: Int
    
    init(_ singleStackCapacity: Int) {
        self.singleStackCapacity = singleStackCapacity
    }
    
    func push(_ item: T) {
        if last == nil {
            setupStacks()
        }
        
        if let s = last?.size() {
            if s >= singleStackCapacity {
                appendStack()
            }
        }
        last?.push(item)
    }
    
    private func setupStacks() {
        let stack = Stack<T>()
        first = stack
        last = stack
    }
    
    private func appendStack() {
        let stack = Stack<T>()
        last?.next = stack
        stack.prev = last
        last = stack
    }
    
    private func removeLastStack() {
        if let prev = last?.prev {
            prev.next = nil
            last = prev
        }
    }
    
    func pop() -> T? {
        
        while true {
            if first === last && first?.size() == 0 {
                break
            }
            if let l = last {
                if l.size() > 0 {
                    return l.pop()
                } else {
                    removeLastStack()
                }
            }
        }
        return nil
    }
    
    func popAtIndex(_ index: Int) -> T? {
        var s: Stack? = first
        for _ in stride(from: 0, to: index, by: 1) {
            s = s?.next
        }
        return s?.pop()
    }
    
    class Stack<T> {
        
        var first: Node<T>?
        var last: Node<T>?
        
        var next: Stack?
        var prev: Stack?
        
        private var _size: Int = 0
        
        func size() -> Int {
            return _size
        }
        
        func isEmpty() -> Bool {
            return first == nil
        }
        
        func push(_ item: T) {
            if last != nil {
                let node = Node(item)
                node.prev = last
                last?.next = node
                last = node
            } else {
                first = Node(item)
                last = first
            }
            _size += 1
        }
        
        func pop() -> T? {
            
            if let item = last {
                item.prev?.next = nil
                last = item.prev
                if last == nil {
                    first = nil
                }
                _size -= 1
                return item.value
            }
            
            return nil
        }
        
        class Node<T> {
            var value: T
            var next: Node?
            var prev: Node?
            
            init(_ item: T) {
                value = item
            }
        }
    }
}

let s = SetOfStacks<Int>(2)
s.push(1)
s.push(2)
s.push(3)
s.push(4)
s.push(5)
s.push(6)
s.push(7)
s.push(8)

var r1 = Array<Int>()

r1.append(s.popAtIndex(0)!)
r1.append(s.popAtIndex(0)!)
r1.append(s.popAtIndex(2)!)
r1.append(s.popAtIndex(2)!)

var r2 = Array<Int>()
r2.append(s.pop()!)
r2.append(s.pop()!)
r2.append(s.pop()!)
r2.append(s.pop()!)

print(r1)
print(r2)
