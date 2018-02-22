func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result = Array<Int>(repeating: 1, count: nums.count)
    var i = 0
    var j = nums.count - 1
    var left = 1;
    var right = 1;
    
    while i < nums.count - 1 {
        left *= nums[i]
        right *= nums[j]
        result[i + 1] *= left
        result[j - 1] *= right
        i += 1
        j -= 1
    }
    return result
}
