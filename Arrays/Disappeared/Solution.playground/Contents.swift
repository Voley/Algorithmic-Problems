/*
   Find All Numbers Disappeared in an Array
     Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
     Find all the elements of [1, n] inclusive that do not appear in this array.
     Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
*/

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var cNums = nums
    for i in 0..<cNums.count {
        if i != (cNums[i] - 1) {
            while (cNums[i] != cNums[cNums[i] - 1]) {
                cNums.swapAt(i, cNums[i] - 1)
            }
        }
    }
    var result = [Int]()
    for i in 0..<cNums.count {
        if i + 1 != cNums[i] {
            result.append(i + 1)
        }
    }
    return result
}

let arr = [5, 4, 2, 1, 6, 6]
print(findDisappearedNumbers(arr))
