import Foundation

func randomMElements(_ m: Int, _ from: [Int]) -> [Int] {
    var array = [Int]()
    
    for i in 0..<m {
        array.append(from[i])
    }
    
    for i in m..<from.count {
        let k = Int(arc4random_uniform(UInt32(i)))
        if k < m {
            array[k] = from[i]
        }
    }
    return array
}

print(randomMElements(3, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
