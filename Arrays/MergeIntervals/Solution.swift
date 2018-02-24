public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func merge(_ intervals: [Interval]) -> [Interval] {
    if intervals.count == 0 {
        return intervals
    }
    let array = intervals.sorted(by: {$0.start < $1.start})
    var result = [Interval]()
    var prev = array[0]
    result.append(prev)
    for i in 1..<array.count {
        let current = array[i]
        if current.start > prev.end {
            result.append(current)
            prev = current
        } else {
            prev.end = max(prev.end, current.end)
        }
    }
    return result
}
