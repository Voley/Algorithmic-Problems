func nthUglyNumber(_ n: Int) -> Int {
    
    var result = [1]
    var i = 0
    var j = 0
    var k = 0
    
    while result.count < n {
        let temp = min(min(result[i] * 2, result[j] * 3), result[k] * 5)
        result.append(temp)
        
        if temp == result[i] * 2 {
            i += 1
        }
        if temp == result[j] * 3 {
            j += 1
        }
        if temp == result[k] * 5 {
            k += 1
        }
    }
    return result[result.count - 1]
}

