func minCost(_ costs: [[Int]]) -> Int {
    guard costs.count > 0 else { return 0 }
    
    var weights = costs
    let size = costs.count
    
    for i in 1..<size {
        
        // We calculate:
        // price of selecting one of colors +
        // price of selecting different color on previous step
        // for each color
        
        let a = min(weights[i - 1][1], weights[i - 1][2])
        weights[i][0] += a
        let b = min(weights[i - 1][2], weights[i - 1][0])
        weights[i][1] += b
        let c = min(weights[i - 1][0], weights[i - 1][1])
        weights[i][2] += c
    }
    let a = weights[size - 1][0]
    let b = weights[size - 1][1]
    let c = weights[size - 1][2]
    
    return min(min(a, b), c)
}
