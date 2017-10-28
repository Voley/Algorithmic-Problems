/*
 Sort Stack
 Write a program to sort a stack such that the smallest items are on top. You can use an additional temporary stack, but you may not copy the elements into any other data structure (such as an array). The stack supports the following operations: `push`, `pop`, `peek` and `isEmpty`
 */

class Stack<T: Comparable> {
    var last: Node?
    
    func sort() {
        let t = Stack<T>()
        while let s = pop() {
            putInSpot(self, t, s)
        }
        while let s = t.pop() {
            push(s)
        }
    }
    
    private func putInSpot(_ source: Stack, _ dest: Stack, _ item: T) {
        var counter = 0
        while true {
            if dest.isEmpty() {
                dest.push(item)
                break
            } else if let confirmedItem = dest.peek() {
                if item >= confirmedItem  {
                    dest.push(item)
                    break
                } else {
                    if let ci = dest.pop() {
                        source.push(ci)
                        counter += 1
                    }
                }
            }
        }
        for _ in stride(from: 0, to: counter, by: 1) {
            guard let z = source.pop() else { continue }
            dest.push(z)
        }
    }
    
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
    
    func peek() -> T? {
        let temp = last
        return temp?.value
    }
    
    func printStack() {
        var node = last
        print("Stack: ")
        var result = ""
        while node != nil {
            if let v = node?.value {
                result.append("\(v) ")
            }
            node = node?.next
        }
        print(result)
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

let s = Stack<Int>()
s.push(5)
s.push(3)
s.push(2)
s.push(9)
s.push(7)
s.push(1)
s.push(4)
s.push(5)

s.printStack()
print("Sorting..")
s.sort()
s.printStack()
