/*
  Implement strStr()
    Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
*/

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.count > haystack.count {
        return -1
    }
    if needle.count == 0 {
        return 0
    }
    
    var hay = Array(haystack)
    var need = Array(needle)
    
    for i in 0..<(hay.count - need.count + 1) {
        var found = true
        for j in 0..<need.count {
            guard i + j < hay.count else {
                found = false
                break
            }
            if hay[i + j] != need[j] {
                found = false
            }
        }
        if found {
            return i
        }
    }
    return -1
}

