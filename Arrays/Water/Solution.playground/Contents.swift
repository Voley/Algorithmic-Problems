func maxArea(_ height: [Int]) -> Int {
    var begin = 0
    var end = height.count - 1
    var total = 0
    while begin < end {
        let minHeight = min(height[begin], height[end])
        let area = (end - begin) * minHeight
        total = max(total, area)
        if height[begin] > height[end] {
            end -= 1
        } else {
            begin += 1
        }
    }
    return total
}

print(maxArea([10, 20, 1]))
