/*
  Find Duplicates
    You have an array with all the numbers from 1 to N, where N is at most 32000. The array may have duplicate entries and you do not know what N is. With only 4 kilobytes of memory available, how would you print all duplicate elements in the array?
 */

class BitVector {
    private var storage: Array<Int32>
    var capacity: Int
    
    func contains(_ value: Int32) -> Bool {
        if value > 32 * capacity {
            return false
        }
        let item: Int32 = storage[Int(value / 32)]
        let bitIndex: Int32 = value % 32
        
        if isBitSet(bitIndex, item) {
            return true
        }
        return false
    }
    
    func add(_ value: Int32) {
        let item: Int32 = storage[Int(value / 32)]
        let bitIndex: Int32 = value % 32
        let result = setBit(bitIndex, item)
        storage[Int(value / 32)] = result
    }
    
    init(_ size: Int) {
        capacity = size
        storage = Array<Int32>(repeatElement(0, count: size))
    }
    
    func setBit(_ at: Int32, _ inValue: Int32) -> Int32 {
        let mask: Int32 = 1 << at
        let value: Int32 = inValue | mask
        return value
    }
    
    func isBitSet(_ at: Int32, _ inValue: Int32) -> Bool {
        return (inValue & (1 << at)) != 0
    }
}

func duplicatesIn(_ array: [Int32]) -> [Int32] {
    var vec = BitVector(100)
    var result = [Int32]()
    for i in array {
        if vec.contains(i) {
            result.append(i)
        }
        vec.add(i)
    }
    return result
}

let dups: [Int32] = [1, 1, 2, 2, 3, 4, 7, 8, 100, 1000, 1000, 99, 99]
print(duplicatesIn(dups))
