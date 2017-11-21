/*
 Remove Element
     Given an array and a value, remove all instances of that value in-place and return the new length.
     Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
     The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    
    var firstPointer = 0
    
    for i in 0..<nums.count {
        if nums[i] != val {
            let temp = nums[firstPointer]
            nums[firstPointer] = nums[i]
            nums[i] = temp
            firstPointer += 1
        }
    }
    return firstPointer
}
