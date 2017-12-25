#include <iostream>
#include <set>
#include <algorithm>

std::set<int> combinations(int n, int shorter, int longer) {
    std::set<int> result;
    for (int i = 0; i <= n; i++) {
        int longerCount = n - i;
        int shorterCount = i;
        result.insert(longerCount * longer + shorterCount * shorter);
    }
    return result;
}

int main() {
    auto set = combinations(3, 2, 3);
    for (auto i: set) {
        std::cout << i << std::endl;
    }
    return 0;
}
