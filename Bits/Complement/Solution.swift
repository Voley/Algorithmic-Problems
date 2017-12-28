
func findCompliment(_ num: Int) -> Int {
    var mask = num
    mask |= mask >> 1
    mask |= mask >> 2
    mask |= mask >> 4
    mask |= mask >> 8
    mask |= mask >> 16
    mask |= mask >> 32
    return mask ^ num
}

print(findCompliment(5))
