func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
    var first = Int.max
    var second = Int.max
    var minX = Int.max
    for (index, word) in words.enumerated() {
        if word == word1 {
            first = index
            minX = min(abs(first - second), minX);
        } else if word == word2 {
            second = index
            minX = min(abs(first - second), minX);
        }
    }
    return minX
}
