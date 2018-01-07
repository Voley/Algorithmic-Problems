func arrayPairSum(_ nums: [Int]) -> Int {
    let array = nums.sorted()
    var sum = 0
    for i in stride(from: 0, to: array.count, by: 2) {
        sum += array[i]
    }
    return sum
}

let arr = [4, 2, 3, 1]
print(arrayPairSum(arr))
