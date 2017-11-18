/*
 Find Pivot Index
     Given an array of integers nums, write a method that returns the "pivot" index of this array.
     We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.
     If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.
 
     Example 1:
     Input:
     nums = [1, 7, 3, 6, 5, 6]
     Output: 3
     Explanation:
     The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
     Also, 3 is the first index where this occurs.
 
     The length of nums will be in the range [0, 10000].
     Each element nums[i] will be an integer in the range [-1000, 1000].
 */

func pivotIndex(_ nums: [Int]) -> Int {
    
    if nums.count < 3 {
        return -1
    }
    
    var sum = 0
    for value in nums {
        sum += value
    }
    
    var leftSum = 0
    var rightSum = sum
    
    for i in 0..<nums.count {
        let value = nums[i]
        if i > 0 {
            leftSum += nums[i - 1]
        }
        rightSum -= value
        if leftSum == rightSum {
            return i
        }
    }
    return -1
}

