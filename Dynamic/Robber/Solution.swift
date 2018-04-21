func robber(_ values: [Int]) -> Int {
    var memo = values
    memo[1] = max(memo[0], memo[1])
    for i in 2..<values.count {
        memo[i] = max(memo[i - 1], values[i] + memo[i - 2])
    }
    
    return memo.last ?? 0
}

print(robber([1, 2]))
print(robber([1, 2, 3]))
print(robber([5, 6, 1, 2, 3]))
