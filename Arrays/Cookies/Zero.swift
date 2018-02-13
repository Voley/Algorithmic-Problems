func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    var total = 0
    let cookies = s.sorted()
    let children = g.sorted()
    var cookiePointer = 0
    for child in children {
        if cookiePointer >= cookies.count {
            break
        }
        while cookiePointer < cookies.count {
            if cookies[cookiePointer] >= child {
                total += 1
                cookiePointer += 1
                break
            }
            cookiePointer += 1
        }
    }
    return total
}
