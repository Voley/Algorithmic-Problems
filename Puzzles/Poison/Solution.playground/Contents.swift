/*
 Poison
 You have 1000 bottles of soda, and exactly one is poisoned. You have 10 test strips which can be used to detect poison. A single drop of poison will turn the test strip positive permanently. You can put any number of drops on a test strip at once and you can reuse a test strip as many times as you'd like (as long as the results are negative). However, you can only run tests once per day and it takes seven days to return a result. How would you figure out the poisoned bottle in as few days as possible?
 */

import Foundation

class Bottle {
    var isPoisoned: Bool = false
    var id: Int
    init(_ identifier: Int) {
        id = identifier
    }
}

class TestStrip {
    var poisoned: Bool = false
    func takeDrop(_ from: Bottle) {
        if from.isPoisoned {
            poisoned = true
        }
    }
}

func generateBottles() -> Array<Bottle> {
    var bottles = Array<Bottle>()
    for i in 0..<1000 {
        let b = Bottle(i + 1)
        bottles.append(b)
    }
    let rand = Int(arc4random_uniform(1000))
    print("Poisoned bottle: \(rand + 1)")
    bottles[rand].isPoisoned = true
    return bottles
}

func generateStrips() -> Array<TestStrip> {
    var array = Array<TestStrip>()
    for _ in 0..<10 {
        array.append(TestStrip())
    }
    return array
}

func runTests(_ bottles: Array<Bottle>, _ strips: Array<TestStrip>) {
    for b in bottles {
        var id = b.id
        var counter = 0
        while id > 0 {
            if id & 1 == 1 {
                strips[9 - counter].takeDrop(b)
            }
            id >>= 1
            counter += 1
        }
    }
}

func numberOfPoisoned(_ strips: Array<TestStrip>) -> Int {
    var result = 0
    for i in stride(from: 0, to: 9, by: 1) {
        let bit = strips[9 - i].poisoned
        if bit {
            let mask = 1 << i
            result |= mask
        }
    }
    return result
}

func printStrips(_ strips: Array<TestStrip>) {
    for s in strips {
        print(s.poisoned)
    }
}

let bottles = generateBottles()
let strips = generateStrips()

runTests(bottles, strips)
print("Found poisoned: ", numberOfPoisoned(strips))
