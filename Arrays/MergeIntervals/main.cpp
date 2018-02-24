#include <iostream>
#include <vector>

struct Interval {
    int start;
    int end;
    Interval() : start(0), end(0) {}
    Interval(int s, int e) : start(s), end(e) {}
};

std::vector<Interval> merge(std::vector<Interval>& intervals) {
    if (intervals.empty()) {
        return intervals;
    }
    std::sort(intervals.begin(), intervals.end(), [](Interval a, Interval b){return a.start < b.start;});
    std::vector<Interval> result;
    result.push_back(intervals[0]);
    for (int i = 1; i < intervals.size(); i++) {
        if (intervals[i].start > result.back().end) {
            result.push_back(intervals[i]);
        } else {
            result.back().end = std::max(result.back().end, intervals[i].end);
        }
    }
    return result;
}

int main() {
    return 0;
}

