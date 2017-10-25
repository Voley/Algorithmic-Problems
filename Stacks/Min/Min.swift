
/*
 Three in one:
 Describe how you could use a single array to implement three stacks.
 */

class MinStack<T: Comparable> {
    var last: Node?
    
    func push(_ item: T) {
        let node = Node(item)
        node.next = last
        last = node
        last?.min = last
        
        if let minNode = last?.next?.min {
            if item > minNode.value! {
                last?.min = minNode
            }
        }
    }
    
    func pop() -> T? {
        let temp = last
        last = last?.next
        return temp?.value
    }
    
    func min() -> T? {
        if last?.min != nil {
            return last?.min?.value
        } else {
            return last?.value
        }
    }
    
    func printStack() {
        var node = last
        while node != nil {
            if let v = node?.value {
                print(v)
            }
            node = node?.next
        }
        if let min = min() {
            print("Minimum: \(min)")
        }
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

let stack = MinStack<Int>()
stack.push(3)
stack.push(5)
stack.push(1)
stack.push(99)
stack.push(0)
stack.printStack()
print("Popping")
_ = stack.pop()
stack.printStack()
