#include <iostream>
#include <vector>
#include <algorithm>

int min_diff(const std::vector<int>& f, const std::vector<int>& s) {
    auto a = f;
    auto b = s;
    sort(a.begin(), a.end());
    sort(b.begin(), b.end());
    int i = 0;
    int j = 0;
    int diff = INT_MAX;
    while (i < a.size() && j < b.size()) {
        if (std::abs(a[i] - b[j]) < diff) {
            diff = std::abs(a[i] - b[j]);
        }
        if (a[i] < b[j]) {
            i++;
        } else {
            j++;
        }
    }
    return diff;
}

int main() {
    auto f = std::vector<int> {50, 100, 500};
    auto s = std::vector<int> {3, 4, 1, 499};
    std::cout << min_diff(f, s) << std::endl;
    return 0;
}
