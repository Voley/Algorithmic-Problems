func contiguousSubsequence(_ array: [Int]) -> Int {
    var sum = 0
    var runningSum = 0
    for num in array {
        runningSum += num
        sum = max(runningSum, sum)
        runningSum = max(runningSum, 0)
    }
    return sum
}

let arr = [2, -8, 3, -2, 4, -10]
print(contiguousSubsequence(arr))
