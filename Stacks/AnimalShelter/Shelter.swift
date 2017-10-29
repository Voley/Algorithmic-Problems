/*
 Animal Shelter.
 An animal shelter, which holds only dogs and cats, operates on a strictly “first in, first out” basis. People must adopt either the “oldest” (based on arrival time) of all animals at the shelter, or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of that type). They cannot select which specific animal they would like. Create the data structures to maintain this system and implement operations such as `enqueue`, `dequeueAny`, `dequeueDog` and `dequeueCat`. You may use the built-in `LinkedList` data structure.
 */

class Node<T> {
    var next: Node?
    var prev: Node?
    var value: T
    init(_ item: T) {
        value = item
    }
}

class Queue<T> {
    private var first: Node<T>?
    private var last: Node<T>?
    
    func enqueue(_ item: T) {
        let wrap = Node(item)
        if first == nil {
            first = wrap
            last = wrap
        } else {
            last?.prev = wrap
            wrap.next = last
            last = wrap
        }
    }
    
    func dequeue() -> T? {
        if let f = first {
            let temp = f.prev
            temp?.next = nil
            first = temp
            return f.value
        }
        return nil
    }
    
    func peek() -> T? {
        return first?.value
    }
    
    func isEmpty() -> Bool {
        return first == nil
    }
}

class Animal {
    var age = 0
    var name: String
    init(_ name: String) {
        self.name = name
    }
}

extension Animal: CustomDebugStringConvertible {
    var debugDescription: String {
        return "A: \(name)"
    }
}



class Dog: Animal {
    
}

class Cat: Animal {
    
}


class Shelter {
    let catQueue = Queue<Cat>()
    let dogQueue = Queue<Dog>()
    var order = 0
    
    func enqueue(_ animal: Animal) {
        animal.age = order
        order += 1
        
        if let dog = animal as? Dog {
            dogQueue.enqueue(dog)
        } else if let cat = animal as? Cat {
            catQueue.enqueue(cat)
        }
    }
    
    func dequeueAny() -> Animal? {
        guard let cat = catQueue.peek() else { return dogQueue.dequeue() }
        guard let dog = dogQueue.peek() else { return catQueue.dequeue() }
        
        if cat.age > dog.age {
            return dogQueue.dequeue()
        }
        return catQueue.dequeue()
    }
    
    func dequeueDog() -> Dog? {
        return dogQueue.dequeue()
    }
    
    func dequeueCat() -> Cat? {
        return catQueue.dequeue()
    }
}

let s = Shelter()
let d1 = Dog("First")
let d2 = Dog("Second")
let d3 = Dog("Third")
let d4 = Dog("Fourth")

let c1 = Cat("Fifth")
let c2 = Cat("Sixth")
let c3 = Cat("Seventh")
let c4 = Cat("Eight")

s.enqueue(d1)
s.enqueue(d2)
s.enqueue(d3)
s.enqueue(d4)
s.enqueue(c1)
s.enqueue(c2)
s.enqueue(c3)
s.enqueue(c4)

var array: Array<Animal> = []
array.append(s.dequeueCat()!)
array.append(s.dequeueCat()!)
array.append(s.dequeueAny()!)
array.append(s.dequeueAny()!)
array.append(s.dequeueAny()!)
array.append(s.dequeueAny()!)
array.append(s.dequeueAny()!)
array.append(s.dequeueAny()!)

print(array)

