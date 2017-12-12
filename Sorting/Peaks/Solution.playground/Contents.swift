/*
   Peaks and Valleys
      In an array of integers, a "peak" is an element which is greater than or equal to the adjacent integers and a "valley" is an element which is less than or equal to the adjacent integers. For example, in the array [5, 8, 6, 2, 3, 4, 6], [8, 6] are peaks and [5, 2] are valleys. Given an array of integers, sort the array into an alternating sequence of peaks and valleys.
 */

func peaks(_ nums: inout [Int]) {
    if nums.count == 0 || nums.count == 1 {
        return
    }
    
    for i in stride(from: 1, to: nums.count - 1, by: 2) {
        let mi = maxIndex(&nums, i - 1, i, i + 1)
        if nums[i] != nums[mi] {
            nums.swapAt(i, mi)
        }
    }
}

func maxIndex(_ nums: inout [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
    
    let first = a >= 0 && a < nums.count ? nums[a] : Int.min
    let second = b >= 0 && b < nums.count ? nums[b] : Int.min
    let third = c >= 0 && c < nums.count ? nums[c] : Int.min
    
    let largest = max(first, max(second, third))
    if largest == first {
        return a
    } else if largest == second {
        return b
    }
    return c
}

var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
peaks(&arr)
print(arr)


