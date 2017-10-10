
/*
 Given two strings, write a method to decide if one is a permutation of the other.
 */

extension String {
    
    public func isPermutation(_ second: String) -> Bool {
        
        if count != second.count {
            return false
        }
        var dict = Dictionary<Character, Int>()
        
        for char in self {
            if let value = dict[char] {
                dict[char] = value + 1
            } else {
                dict[char] = 1
            }
        }
        
        for char in second {
            if let value = dict[char] {
                if value <= 0 {
                    return false
                }
                dict[char] = value - 1
            } else {
                return false
            }
        }
        return true
    }
}

private func checkPermutation(_ first: String, _ second: String) {
    print("Is \"\(first)\" a permutation of \"\(second)\"? \(first.isPermutation(second))")
}

checkPermutation("Hello, world!", "Hello")
checkPermutation("Hello", "elloH")
checkPermutation("12345", "34520")
checkPermutation("1", "0")
checkPermutation("z ", "x ")
checkPermutation("", "")


