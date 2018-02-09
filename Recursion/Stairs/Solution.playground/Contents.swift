func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var memo = [Int](repeating: 99999, count: cost.count)
    memo[0] = cost[0]
    memo[1] = cost[1]
    for i in 2..<cost.count {
        memo[i] = cost[i] + min(memo[i - 1], memo[i - 2])
    }
    return min(memo[memo.count - 1], memo[memo.count - 2])
}
