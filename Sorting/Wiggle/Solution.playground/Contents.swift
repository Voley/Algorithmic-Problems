/*
 Wiggle Sort
     Given an unsorted array nums, reorder it in-place such that nums[0] <= nums[1] >= nums[2] <= nums[3]....
     
     For example, given nums = [3, 5, 2, 1, 6, 4], one possible answer is [1, 6, 2, 5, 3, 4].
 */

func wiggleSort(_ nums: inout [Int]) {
    if nums.count == 0 || nums.count == 1 {
        return
    }
    for i in 1..<nums.count {
        if ((i % 2) > 0) == (nums[i - 1] > nums[i]) {
            nums.swapAt(i, i - 1)
        }
    }
}

var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
wiggleSort(&arr)
print(arr)
