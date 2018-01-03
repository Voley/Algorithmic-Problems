func maximumSubarray(_ array: [Int]) -> Int {
    var sum = Int.min
    var runningSum = 0
    for num in array {
        runningSum += num
        runningSum = max(runningSum, num)
        sum = max(runningSum, sum)
    }
    return sum
}

let arr = [-2,1,-3,4,-1,2,1,-5,4]
print(maximumSubarray(arr))
