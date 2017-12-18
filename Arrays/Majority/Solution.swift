/*
   Majority Element
     Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
     You may assume that the array is non-empty and the majority element always exist in the array.
*/

func majority(_ nums: [Int]) -> Int {
    var counter = 0
    var value = 0
    for i in 0..<nums.count {
        if counter == 0 {
            counter += 1
            value = nums[i]
        } else if value != nums[i] {
            counter -= 1
        } else {
            counter += 1
        }
    }
    return value
}

let nums = [1, 3, 3, 4, 5, 6, 3, 3, 3]
print(majority(nums))
