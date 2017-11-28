/*
 Magic Index
    A magic index in an array A[1...n-1] is defined to be an index such that A[i] = i. Given a sorted array of distinct integers, write a method to find a magic index, if one exists, in array A.
    FOLLOW UP
    What if the values are not distinct?
 */

func magicIndex(_ array: [Int]) -> Int {
    return recursiveMagicIndex(array, 0, array.count - 1)
}

func recursiveMagicIndex(_ array: [Int], _ low: Int, _ high: Int) -> Int {
    if high < low {
        return -1
    }
    let mid = high - (high - low) / 2
    if array[mid] == mid {
        return mid
    }
    
    let left = recursiveMagicIndex(array, low, min(mid - 1, array[mid]))
    if left != -1 {
        return left
    }
    
    let right = recursiveMagicIndex(array, max(mid + 1, array[mid]), high)
    return right
}

let arr = [-10, -5, 2, 2, 2, 3, 4, 7, 9, 12, 13]
print(magicIndex(arr))
