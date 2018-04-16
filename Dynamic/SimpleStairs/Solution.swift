func stairs(_ n: Int) -> Int {
    var memo = Array<Int>(repeating: 0, count: n + 1)
    
    // there is one way to get to step 1
    // there are two ways to get to step 2 (1 + 1 or 2)
    
    memo[1] = 1
    memo[2] = 2
    if n < 3 {
        return memo[n]
    }
    
    for i in 3...n {
        memo[i] = memo[i - 1] + memo[i - 2]
    }
    return memo[n]
}
