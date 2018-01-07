#include <iostream>
#include <vector>
#include <unordered_map>

std::vector<std::pair<int, int>> pair(const std::vector<int>& nums, int value) {
    std::vector<std::pair<int, int>> result;
    std::unordered_map<int, int> map;
    for (const int& i: nums) {
        map[i] += 1;
    }
    for (const auto& i: map) {
        int target = value - i.first;
        if (map[target] > 0 && map[i.first] > 0) {
            result.push_back({i.first, target});
            map[target]--;
        }
    }
    return result;
}

int main() {
    auto pairs = pair({1, 4, 3, 2, 4, 6}, 5);
    for (auto pair: pairs) {
        std::cout << pair.first << " " << pair.second << std::endl;
    }
    return 0;
}
