func binaryKnapsack(_ values: [[Int]], _ capacity: Int) -> Int  { // 0 - weight, 1 - value
    var memo = Array<Array<Int>>(repeatElement(Array<Int>(repeating: 0, count: capacity + 1), count: values.count))
    var weights = values.sorted { (a, b) in
        a[0] < b[0]
    }
    for i in 0..<weights.count {
        let itemWeight = weights[i][0]
        let itemValue = weights[i][1]
        for j in 1...capacity {
            if itemWeight > j {
                memo[i][j] = i > 0 ? memo[i - 1][j] : 0
            } else {
                // including item
                let a = i > 0 ? itemValue + memo[i - 1][capacity - itemWeight] : 0
                
                // not inlcuding item
                let b = i >= 1 ? memo[i - 1][j] : 0
                memo[i][j] = max(a, b)
            }
        }
    }
    return memo[values.count - 1][capacity]
}

print(binaryKnapsack([[10, 60], [30, 120], [20, 100]], 50))
