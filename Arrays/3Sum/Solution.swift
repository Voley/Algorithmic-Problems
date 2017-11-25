/*
 3Sum
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 Note: The solution set must not contain duplicate triplets.
 */

func threeSum(_ nums: [Int]) -> [[Int]] {
    
    if nums.count < 3 {
        return []
    }
    var n = nums.sorted()
    var result = [[Int]]()
    
    for i in 0..<n.count - 2 {
        
        if i > 0 && n[i] == n[i - 1] {
            continue
        }
        var left = i
        var right = n.count - 1
        
        while left < right {
            let sum = n[i] + n[left] + n[right]
            
            if right < n.count - 1 && n[right] == n[right + 1] {
                right -= 1
            } else if sum > 0 {
                right -= 1
            } else if sum < 0 {
                left += 1
            } else {
                result.append([n[i], n[left], n[right]])
                right -= 1
                left += 1
            }
        }
    }
    return result
}
