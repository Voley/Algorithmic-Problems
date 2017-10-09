
/*
 Implement an algorithm to determine if a string has all unique characters.
 What if you cannot use additional data structures?
 */


class UniqueSolver {
    
    public func isUnique(_ target: String) -> Bool {
        //return isUniqueSorting(target)
        return isUniqueHashTable(target)
    }
    
    private func isUniqueSorting(_ target: String) -> Bool {
        
        // O(n log n)
        
        let sortedString = target.sorted()
        
        var lastCharacter: Character? = nil
        
        for char in sortedString {
            if char == lastCharacter {
                return false
            } else {
                lastCharacter = char
            }
        }
        
        return true
    }
    
    private func isUniqueHashTable(_ target: String) -> Bool {
        
        // O(n) and O(n) memory
        
        var dict = Dictionary<Character, Bool>()
        
        for char in target {
            
            if dict[char] != nil {
                return false
            }
            dict[char] = true
        }
        
        return true
    }
}

let solver = UniqueSolver()

print(solver.isUnique("bac"),solver.isUnique("abcdefg"),
      solver.isUnique("1231"))
