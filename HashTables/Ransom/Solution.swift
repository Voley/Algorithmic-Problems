func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var map = Dictionary<Character, Int>()
    for ch in magazine {
        if let val = map[ch] {
            map[ch] = val + 1
        } else {
            map[ch] = 1
        }
    }
    
    for ch in ransomNote {
        if let val = map[ch] {
            if val <= 0 {
                return false
            }
            map[ch] = val - 1
        } else {
            return false
        }
    }
    return true
}

print(canConstruct("yo", "yammingao"))
