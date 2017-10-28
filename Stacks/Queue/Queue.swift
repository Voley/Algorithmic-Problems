
/*
 Queue:
 Implement a queue with two stacks.
 */

class Queue<T> {
    private var enqStack: Stack<T>
    private var deqStack: Stack<T>
    
    init() {
        enqStack = Stack<T>()
        deqStack = Stack<T>()
    }
    
    func enqueue(_ item: T) {
        enqStack.push(item)
    }
    
    func dequeue() -> T? {
        if deqStack.isEmpty() {
            while let item = enqStack.pop() {
                deqStack.push(item)
            }
        }
        return deqStack.pop()
    }
    
    func isEmpty() -> Bool {
        return enqStack.isEmpty() && deqStack.isEmpty()
    }
}

class Stack<T> {
    var last: Node?
    
    func push(_ item: T) {
        let node = Node(item)
        node.next = last
        last = node
    }
    
    func pop() -> T? {
        let temp = last
        last = last?.next
        return temp?.value
    }
    
    func printStack() {
        var node = last
        while node != nil {
            if let v = node?.value {
                print(v)
            }
            node = node?.next
        }
    }
    
    func isEmpty() -> Bool {
        return last == nil
    }
    
    class Node {
        var next: Node?
        var value: T?
        var min: Node?
        
        init(_ value: T) {
            self.value = value
        }
    }
}

let q = Queue<Int>()
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
q.enqueue(5)
q.enqueue(6)
q.enqueue(7)

var arr = Array<Int>()
while let item = q.dequeue() {
    arr.append(item)
}

print(arr)

