/*
 Single Number
 Given an array of integers, every element appears twice except for one. Find that single one.
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for value in nums {
        result ^= value
    }
    return result
}

