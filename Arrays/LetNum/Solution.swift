func longestSubarray(_ array: [Character]) -> [Character] {
    var diff = calculateDifferences(array)
    var table = Dictionary<Int, Int>()
    var maxPair: (Int, Int)?
    
    for i in 0..<diff.count {
        let val = diff[i]
        if let index = table[val] {
            let distance = abs(index - i)
            let longest = maxPair == nil ? Int.min : maxPair!.0 - maxPair!.1
            if distance > longest {
                maxPair = (index, i)
            }
        } else {
            table[val] = i
        }
    }
    var result = [Character]()
    if let pair = maxPair {
        for i in (pair.0 + 1)...pair.1 {
            result.append(array[i])
        }
    }
    return result
}

func calculateDifferences(_ array: [Character]) -> [Int] {
    var result = [Int]()
    var delta = 0
    
    for c in array {
        if isLetter(c) {
            delta += 1
        } else if isDigit(c) {
            delta -= 1
        }
        result.append(delta)
    }
    return result
}

func isDigit(_ ch: Character) -> Bool {
    struct Storage {
        static let set = Set<Character>("01234567890")
    }
    return Storage.set.contains(ch)
}

func isLetter(_ ch: Character) -> Bool {
    struct Storage {
        static let set = Set<Character>("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM")
    }
    return Storage.set.contains(ch)
}

print(longestSubarray(["a", "1", "2", "3", "z", "b"]))
