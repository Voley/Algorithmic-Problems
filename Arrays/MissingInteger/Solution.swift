/*
  First Missing Positive
     Given an unsorted integer array, find the first missing positive integer.
     For example,
     Given [1,2,0] return 3,
     and [3,4,-1,1] return 2.
 */

func firstMissingPositive(_ nums: [Int]) -> Int {
    var numbers = nums
    let count = nums.count
    var counter = 0
    while counter < count {
        var position = 0
        if numbers[counter] > 0 && numbers[counter] <= count {
            position = numbers[counter] - 1
            if numbers[position] != numbers[counter] {
                swap(&numbers, position, counter)
                counter -= 1
            }
        }
        counter += 1
    }
    for i in 0..<count {
        if numbers[i] != i + 1 {
            return i + 1
        }
    }
    return count + 1
}

func swap(_ arr: inout [Int], _ i1: Int, _ i2: Int) {
    let temp = arr[i1]
    arr[i1] = arr[i2]
    arr[i2] = temp
}

print(firstMissingPositive([8, 2, 4, 5, 3, 1, 7]))

