class BitInteger {
    static let max = 64
    private var storage: [Int] = []
    
    func fetch(_ index: Int) -> Int {
        return storage[BitInteger.max - 1 - index]
    }
    
    init(_ number: Int) {
        var result = [Int](repeatElement(0, count: 64))
        var temp = number
        var counter = 63
        while temp > 0 {
            result[counter] = temp % 2
            temp >>= 1
            counter -= 1
        }
        storage = result
    }
}

func findMissing(_ nums: [BitInteger]) -> Int {
    return missingHelper(nums, 0)
}

func missingHelper(_ input: [BitInteger], _ column: Int) -> Int {
    if column >= BitInteger.max {
        return 0
    }
    var oneBits = [BitInteger]()
    var zeroBits = [BitInteger]()
    
    for b in input {
        if b.fetch(column) == 0 {
            zeroBits.append(b)
        } else {
            oneBits.append(b)
        }
    }
    
    if zeroBits.count <= oneBits.count {
        let v = missingHelper(zeroBits, column + 1)
        return (v << 1) | 0
    } else {
        let v = missingHelper(oneBits, column + 1)
        return (v << 1) | 1
    }
}

let bits = [0, 1, 2, 3, 5, 6, 7].map({return BitInteger($0)})
print(findMissing(bits))

