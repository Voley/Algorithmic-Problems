import Foundation

func rand(_ from: Int, _ upToExcluding: Int) -> Int {
    return Int(arc4random_uniform(UInt32(upToExcluding)))
}

func shuffle(_ cards: inout [Int]) {
    for i in 0..<cards.count - 2 {
        let k = rand(0, cards.count)
        cards.swapAt(i, k)
    }
}

var array = [1, 2, 3, 4]
shuffle(&array)
print(array)
