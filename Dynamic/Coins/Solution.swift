func changeCombinations(_ coins: [Int], _ n: Int) -> Int {
    var memo = [Int](repeating: 0, count: n + 1)
    memo[0] = 1
    
    for coin in coins {
        for i in 1...n {
            if i >= coin {
                memo[i] = memo[i] + memo[i - coin]
            }
        }
    }
    return memo[n]
}

print(changeCombinations([1, 2, 3], 4))

