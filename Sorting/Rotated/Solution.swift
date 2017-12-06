/*
   Search in Rotated Sorted Array
     Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
     (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
     You are given a target value to search. If found in the array return its index, otherwise return -1.
 
     You may assume no duplicate exists in the array.
*/

func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        
        let mid = right - (right - left) / 2
        if nums[mid] == target {
            return mid
        }
        
        if nums[mid] > nums[right] {
            if target < nums[mid] && target >= nums[left] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else if nums[mid] < nums[left] {
            if target > nums[mid] && target <= nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        } else {
            if target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }
    return -1
}

var test: [Int] = [3, 1]
print(search(test, 1))
