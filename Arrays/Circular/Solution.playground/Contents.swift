/*
 Circular Array
    Implement a `CircularArray` class that supports an array-like data structure which can be effeciently rotated. If possible, the class should use a generic type (also called a template), and should support iteration via the standard `for item in array` notation.
*/

class CircularArray<T> {
    
    var count: Int = 0
    var storage: Array<T> = []
    private var offset = 0
    fileprivate var iteratingCounter = 0
    
    subscript(index: Int) -> T? {
        get {
            return elementAtIndex(index)
        }
        
        set(newValue) {
            if let value = newValue {
                insert(value, index)
            }
        }
    }
    
    private func insert(_ element: T, _ index: Int) {
        storage.insert(element, at: convert(index))
        count += 1
    }

    func elementAtIndex(_ index: Int) -> T? {
        if index < 0 || index >= count {
            return nil
        }
        return storage[convert(index)]
    }
    
    func rotate(_ by: Int) {
        offset = convert(by)
    }
    
    private func convert(_ index: Int) -> Int {
        
        if offset == 0 {
            return index
        }
        
        var value = index
        if value < 0 {
            value += count
        }
        return (offset + value) % storage.count
    }
    
    func printContents() {
        var result = ""
        for i in 0..<storage.count {
            result += "\(storage[convert(i)]) "
        }
        print(result)
    }
}

extension CircularArray: Sequence {
    
    typealias Iterator = CircularIterator
    
    class CircularIterator: IteratorProtocol {
        
        public typealias Element = T
        
        var current = 0
        weak var arr: CircularArray<T>?
        
        init(_ array: CircularArray) {
            arr = array
        }
        
        func next() -> CircularArray<T>.CircularIterator.Element? {
            if let array = arr {
                let result = array[current]
                current += 1
                return result
            }
            return nil
        }
    }
    
    func makeIterator() -> CircularArray<T>.Iterator {
        return CircularIterator(self)
    }
}

var array = CircularArray<String>()
array[0] = "a"
array[1] = "b"
array[2] = "c"
array[3] = "d"
array[4] = "e"

array.printContents()
print("Rotating by 3")
array.rotate(3)
array.printContents()
