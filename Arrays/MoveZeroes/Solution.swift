/*
  Move Zeroes
     Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
     For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
     Note:
     You must do this in-place without making a copy of the array.
     Minimize the total number of operations.
*/

func moveZeroes(_ nums: inout [Int]) {
    var write = 0
    var read = 0
    
    while read < nums.count {
        if nums[read] != 0 {
            nums.swapAt(write, read)
            write += 1
        }
        read += 1
    }
}

var n = [1, 0, 2, 0, 0, 3, 0, 4, 0]
print("Input: ", n)
moveZeroes(&n)
print("Output: ", n)


