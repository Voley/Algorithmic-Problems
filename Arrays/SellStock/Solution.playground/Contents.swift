func maxProfit(_ prices: [Int]) -> Int {
    if prices.count <= 1 {
        return 0
    }
    var maximum = 0
    for i in 1..<prices.count where prices[i] > prices[i - 1] {
        maximum += prices[i] - prices[i - 1]
    }
    return maximum
}
