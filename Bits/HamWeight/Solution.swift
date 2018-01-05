func hammingWeight(_ a: UInt) -> Int {
    var count = 0
    var temp = a
    while temp > 0 {
        count += 1
        temp &= (temp - 1)
    }
    return count
}

print(hammingWeight(156))
