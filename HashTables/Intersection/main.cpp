#include <iostream>
#include <vector>
#include <set>

std::vector<int> intersection(const std::vector<int>& nums1, const std::vector<int>& nums2) {
    std::set<int> dict;
    for (auto i: nums1) {
        dict.insert(i);
    }
    std::vector<int> result;
    for (auto i: nums2) {
        if (dict.find(i) != dict.end()) {
            result.push_back(i);
            dict.erase(i);
        }
    }
    return result;
}

int main() {
    auto result = intersection({1, 2, 3}, {3});
    for (auto i: result) {
        std::cout << i << std::endl;
    }
    return 0;
}
