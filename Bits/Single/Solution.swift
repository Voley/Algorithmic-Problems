/*

 */

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for value in nums {
        result ^= value
    }
    return result
}

