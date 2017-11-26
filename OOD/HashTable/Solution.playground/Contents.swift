/*
 Hash Table
    Design and implement a hash table that uses chaining (linked lists) to handle collisions.
*/

class HashTable<Key: Hashable, Value> {
    private var storage: Array<Node>
    private var entityCount = 0
    private var sizeIndex = 0
    private let sizes = [55, 144, 233, 610, 987, 1597, 4181, 10946, 17711, 28657, 121393, 196418]
    
    init() {
        storage = Array<Node>(repeatElement(Node(), count: sizes[0]))
    }
    
    func add(_ val: Value, forKey: Key) {
        
        if object(forKey) != nil {
            return
        }
        
        let bucket: Int = abs(forKey.hashValue % sizes[sizeIndex])
        let newNode = Node(val, forKey)
        let node = storage[bucket]
        if node.isEmpty {
            storage[bucket] = newNode
        } else {
            var temp: Node? = node
            while temp?.next != nil {
                temp = temp?.next
            }
            temp?.next = newNode
        }
        entityCount += 1
    }
    
    func object(_ forKey: Key) -> Value? {
        let bucket: Int = abs(forKey.hashValue % sizes[sizeIndex])
        let node = storage[bucket]
        
        if node.isEmpty {
            return nil
        } else if node.key == forKey {
            return node.value
        } else {
            var temp: Node? = node
            while let n = temp?.next {
                if n.key == forKey && !n.isEmpty {
                    return n.value
                }
                temp = n
            }
        }
        return nil
    }
    
    func remove(_ forKey: Key) {
        let bucket: Int = abs(forKey.hashValue % sizes[sizeIndex])
        let node = storage[bucket]
        
        if node.isEmpty {
            return
        } else if node.key == forKey {
            node.isEmpty = true
        } else {
            var temp: Node? = node
            while let n = temp?.next {
                if n.key == forKey{
                    node.isEmpty = true
                    break
                }
            }
        }
        return
    }
    
    class Node {
        var value: Value?
        var next: Node?
        var key: Key?
        var isEmpty = true
        
        init(_ val: Value, _ key: Key) {
            self.value = val
            self.key = key
            isEmpty = false
        }
        
        init() {
        }
    }
}


let z = HashTable<String, Int>()
z.add(123, forKey: "Some key")
z.add(124, forKey: "S2")
z.add(199, forKey: "S3")
z.add(156, forKey: "z")
z.add(2, forKey: "y")

z.remove("z")

print(z.object("Some key"), z.object("S2"), z.object("S3"), z.object("z"), z.object("y"))


