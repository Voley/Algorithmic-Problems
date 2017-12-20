/*
    Smallest Difference
        Given two arrays of integers, compute the pair of values (one value) in each array) with the smallest (non-negative) difference. Return the difference.
 */

func smallestDifference(_ first: [Int], _ second: [Int]) -> Int {
    let f = first.sorted()
    let s = second.sorted()
    
    var fIndex = 0
    var sIndex = 0
    var min = Int.max
    
    while fIndex < f.count && sIndex < s.count {
        let diff = f[fIndex] > s[sIndex] ? f[fIndex] - s[sIndex] : s[sIndex] - f[fIndex]
        if diff == 0 {
            return diff
        }
        if diff < min {
            min = diff
        }
        
        if f[fIndex] < s[sIndex] {
            fIndex += 1
        } else {
            sIndex += 1
        }
    }
    return min
}

print(smallestDifference([1, 50, 550], [549]))
