func longestConsecutive(_ nums: [Int]) -> Int {
    let set = Set<Int>(nums)
    var longest = 0
    for value in nums {
        if !set.contains(value - 1) {
            var current = 1
            var temp = value + 1
            while set.contains(temp) {
                temp += 1
                current += 1
            }
            longest = max(current, longest)
        }
    }
    return longest
}

print(longestConsecutive([300, 299, 1, 301, 2, 3, 302]))

