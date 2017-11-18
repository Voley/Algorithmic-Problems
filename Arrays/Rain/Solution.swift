/*
 Trapping Rain Water
     Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
     For example,
     Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
*/

func trap(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var total = 0
    var leftMax = 0
    var rightMax = 0
    
    while left < right {
        if height[left] < height[right] {
            if height[left] >= leftMax {
                leftMax = height[left]
            } else {
                total += leftMax - height[left]
            }
            left += 1
        } else {
            if height[right] >= rightMax {
                rightMax = height[right]
            } else {
                total += rightMax - height[right]
            }
            right -= 1
        }
    }
    return total
}

let arr = [0,1,0,2,1,0,1,3,2,1,2,1]
print("Total water for \(arr) is: \(trap(arr))")
