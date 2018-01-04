func firstUniqChar(_ s: String) -> Int {
    var set = Dictionary<Character, Int>()
    for c in s {
        if let num = set[c] {
            set[c] = num + 1
        } else {
            set[c] = 1
        }
    }
    var counter = 0
    for c in s {
        if let num = set[c] {
            if num == 1 {
                return counter
            }
        }
        counter += 1
    }
    return -1
}
