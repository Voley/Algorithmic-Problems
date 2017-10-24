
/*
 Three in one:
 Describe how you could use a single array to implement three stacks.
 */

import Foundation

class ThreeStack<T> {
    var data: NSMutableArray
    var aStack: Stack<T>
    var bStack: Stack<T>
    var cStack: Stack<T>
    var capacity: Int
    
    init(_ capacity: Int) {
        data = NSMutableArray()
        self.capacity = capacity
        for _ in stride(from: 0, to: capacity, by: 1) {
            data.add(NSNull())
        }
        
        aStack = Stack(0, data)
        bStack = Stack(1, data)
        cStack = Stack(2, data)
    }
    
    class Stack<T> {
        var array: NSMutableArray
        var offset: Int
        var count: Int
        
        init(_ offset: Int, _ array: NSMutableArray) {
            self.offset = offset
            count = 0
            self.array = array
        }
        
        func pop() -> T? {
            if count <= 0 {
                return nil
            }
            if let item = array[(count - 1) * 3 + offset] as? T {
                count -= 1;
                return item
            }
            count -= 1;
            return nil
        }
        func push(_ item: T) {
            count += 1
            array[(count - 1) * 3 + offset] = item
        }
        
        func printStack() {
            print("Stack: ")
            for i in stride(from: count, to: 0, by: -1) {
                if let item = array[(i - 1) * 3 + offset] as? T {
                    print(item)
                }
            }
        }
    }
}

let threeStack = ThreeStack<Int>(10)
threeStack.aStack.push(123)
threeStack.aStack.push(10)
threeStack.aStack.push(99)
threeStack.aStack.printStack()

threeStack.bStack.push(1)
threeStack.bStack.push(2)
threeStack.bStack.push(3)
threeStack.bStack.printStack()

threeStack.cStack.push(99)
threeStack.cStack.push(100)
threeStack.cStack.push(101)
threeStack.cStack.printStack()
