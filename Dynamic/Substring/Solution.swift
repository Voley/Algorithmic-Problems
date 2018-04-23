func longestSubstring(_ a: String, _ b: String) -> Int {
    if (a.count == 0 || b.count == 0) {
        return 0
    }
    
    let s1 = Array(a)
    let s2 = Array(b)
    var maxS = 0
    var memo = Array<Array<Int>>(repeatElement(Array<Int>(repeating: 0, count: (s2.count + 1)), count: (s1.count + 1)))
    
    for i in 1...s1.count {
        for j in 1...s2.count {
            if s1[i - 1] == s2[j - 1] {
                memo[i][j] = memo[i - 1][j - 1] + 1
                maxS = max(memo[i][j], maxS)
            } else {
                memo[i][j] = 0
            }
        }
    }
    return maxS
}

print(longestSubstring("abcdef", "ef"))
print(longestSubstring("axc", "efg"))
print(longestSubstring("abcdef", ""))

