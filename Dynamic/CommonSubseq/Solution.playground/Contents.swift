func longestSubsequence(_ a: String, _ b: String) -> Int {
    let h = Array(a)
    let v = Array(b)
    var memo = Array<Array<Int>>(repeating: Array<Int>(repeatElement(0, count: h.count + 1)), count: v.count + 1)
    
    for i in 1...v.count {
        for j in 1...h.count {
            // characters match
            if v[i - 1] == h[j - 1] {
                memo[i][j] = memo[i - 1][j - 1] + 1
            } else { // characters do not match
                memo[i][j] = max(memo[i - 1][j], memo[i][j - 1])
            }
        }
    }
    return memo[v.count][h.count]
}
