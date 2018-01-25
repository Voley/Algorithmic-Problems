#include <iostream>
#include <vector>

struct Interval {
    int start;
    int end;
    Interval() : start(0), end(0) {}
    Interval(int s, int e) : start(s), end(e) {}
};

bool canAttendMeetings(std::vector<Interval>& intervals) {
    if (intervals.size() <= 1) {
        return true;
    }
    std::vector<Interval> s = intervals;
    std::sort(std::begin(s), std::end(s), [](const Interval& lhs, const Interval& rhs){ return lhs.start < rhs.start; });
    for (int i = 0; i < s.size() - 1; i++) {
        if (s[i].end > s[i + 1].start) {
            return false;
        }
    }
    return true;
}

int main() {
    return 0;
}
