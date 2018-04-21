func findLongestChain(_ pairs: [[Int]]) -> Int {
    let s = pairs.sorted(by: {($0[1] < $1[1])})
    var current = Int.min
    var count = 0
    
    for pair in s {
        if pair[0] > current {
            count += 1
            current = pair[1]
        }
    }
    return count
}

print(findLongestChain([[2, 3], [3, 4], [1, 2]]))
