func countSegments(_ s: String) -> Int {
    var segments = 0
    var prev: Character = " "
    for ch in s {
        if ch == " " && prev != " " {
            segments += 1
        }
        prev = ch
    }
    
    if prev != " " {
        segments += 1
    }
    
    return segments
}
