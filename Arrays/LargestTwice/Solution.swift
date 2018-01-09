func dominantIndex(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return -1
    }
    var max = nums[0]
    var index = 0
    
    for i in 0..<nums.count {
        if nums[i] > max {
            max = nums[i]
            index = i
        }
    }
    
    for i in 0..<nums.count  {
        if i == index {
            continue
        }
        if nums[i] * 2 > max {
            return -1
        }
    }
    return index
}

print(dominantIndex([1, 2, 4]))
