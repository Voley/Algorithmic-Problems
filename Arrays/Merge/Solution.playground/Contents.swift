/*
  Merge Sorted Array
    Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
    Note:
    You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2. The number of elements initialized in nums1 and nums2 are m and n respectively.
*/

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var a = m - 1
    var b = n - 1
    var end = m + n - 1
    
    while a >= 0 && b >= 0 {
        if nums1[a] > nums2[b] {
            nums1[end] = nums1[a]
            a -= 1
        } else {
            nums1[end] = nums2[b]
            b -= 1
        }
        end -= 1
    }
    
    while b >= 0 {
        nums1[end] = nums2[b]
        end -= 1
        b -= 1
    }
}

var a = [5, 6, 7, 8, 11, 12, 0, 0, 0, 0]
let b = [1, 2, 9, 10]
merge(&a, 6, b, 4)
print(a)

