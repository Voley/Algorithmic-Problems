/*
 Remove Duplicates from Sorted Array
     Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.
     Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
     Example:
     Given nums = [1,1,2],
     Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
     It doesn't matter what you leave beyond the new length.
*/

func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 0 {
        return 0
    }
    var index = 1
    
    for i in 1 ..< nums.count {
        if nums[i] != nums[i-1] {
            nums[index] = nums[i]
            index += 1
        }
    }
    return index
}

var a: Array<Int> = [1, 1, 2, 2, 3, 4, 5, 6, 6, 7, 7, 8]

print(removeDuplicates(&a))

print(a)
