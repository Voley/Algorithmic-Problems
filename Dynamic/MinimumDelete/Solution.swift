extension Character {
    var ascii: Int {
        return Int(String(self).unicodeScalars.filter{$0.isASCII}.first!.value)
    }
}

func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
    let a = s1.map( { return $0.ascii }) // horizontal
    let b = s2.map( { return $0.ascii }) // vertical
    
    var memo = [[Int]](repeating: [Int](repeating: 0, count: b.count + 1), count:a.count + 1)
    memo[0][0] = 0
    
    for i in 1...a.count {
        memo[i][0] = memo[i - 1][0] + a[i - 1]
    }
    
    for i in 1...b.count {
        memo[0][i] = memo[0][i - 1] + b[i - 1]
    }
    for i in 1...a.count {
        for j in 1...b.count {
            if a[i - 1] == b[j - 1] {
                memo[i][j] = memo[i-1][j-1]
            } else {
                let a = memo[i-1][j] + a[i-1]
                let b = memo[i][j-1] + b[j-1]
                memo[i][j] = min(a, b)
            }
        }
    }
    return memo[a.count][b.count]
}

print(minimumDeleteSum("sea", "eat"))
