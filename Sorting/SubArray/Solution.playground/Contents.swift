func findUnsortedSubarray(_ nums: [Int]) -> Int {
    if nums.count <= 1 {
        return 0
    }
    var start = 0
    var end = -1
    var mmin = Int.max
    var mmax = Int.min
    
    var left = 0
    var right = nums.count - 1
    
    while right >= 0 {
        mmax = max(mmax, nums[left])
        if nums[left] != mmax {
            end = left
        }
        
        mmin = min(mmin, nums[right])
        if nums[right] != mmin {
            start = right
        }
        left += 1
        right -= 1
    }
    return end - start + 1
}

print(findUnsortedSubarray([2,6,4,8,10,9,15]))
