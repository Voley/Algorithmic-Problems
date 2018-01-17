func increasingTriplet(_ nums: [Int]) -> Bool {
    var first = Int.max
    var second = Int.max
    
    for i in nums {
        if i <= first {
            first = i
        } else if i <= second {
            second = i
        } else {
            return true
        }
    }
    return false
}
