func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var set = Set<Int>()
    for (index, value) in nums.enumerated() {
        if set.contains(value) {
            return true
        }
        set.insert(value)
        if set.count > k {
            set.remove(nums[index - k])
        }
    }
    return false
}
