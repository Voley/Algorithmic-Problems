func maxPrice(_ rod: Int, _ prices: [Int]) -> Int {
    var dict = Dictionary<Int, Int>()
    return maxPrice(rod, prices, &dict)
}

func maxPrice(_ rod: Int, _ prices: [Int], _ memo: inout Dictionary<Int, Int>) -> Int {
    if rod == 0 {
        return 0
    }
    
    if let memoized = memo[rod] {
        return memoized
    }
    
    var m = 0
    for i in 0..<rod {
        let current = prices[rod - i] + maxPrice(i, prices, &memo)
        m = max(m, current)
    }
    memo[rod] = m
    return m
}

print(maxPrice(10, [0, 10, 2, 4, 3, 15, 17, 4, 3, 5, 10, 3, 2, 22]))
