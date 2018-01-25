public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func canAttendMeetings(_ intervals: [Interval]) -> Bool {
    guard intervals.count > 0 else { return true }
    let s = intervals.sorted(by: {$0.start < $1.start})
    for i in 0..<s.count - 1 {
        if s[i].end > s[i + 1].start {
            return false
        }
    }
    return true
}
