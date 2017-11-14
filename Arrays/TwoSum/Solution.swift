/*
 Two Sum:
     Given an array of integers, return indices of the two numbers such that they add up to a specific target.
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
     Example:
     Given nums = [2, 7, 11, 15], target = 9,
     Because nums[0] + nums[1] = 2 + 7 = 9,
     return [0, 1].
*/

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dict = Dictionary<Int, Int>()
    var result = Array<Int>()
    // missing to sum, index
    for index in 0..<nums.count {
        if let otherIndex = dict[nums[index]] {
            // we have found result
            result.append(otherIndex)
            result.append(index)
            return result
        } else {
            dict[target - nums[index]] = index
        }
    }
    return []
}

let some = [1, 2, 3, 4, 5, 0, 30, 20]
print(twoSum(some, 50))
