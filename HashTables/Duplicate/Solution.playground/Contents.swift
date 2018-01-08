func containsDuplicate(_ nums: [Int]) -> Bool {
    var set = Set<Int>()
    for num in nums {
        if set.contains(num) {
            return true
        }
        set.insert(num)
    }
    return false
}

print(containsDuplicate([1, 2, 3, 1]))
print(containsDuplicate([1, 2, 3]))
