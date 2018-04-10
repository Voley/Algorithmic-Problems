#include <iostream>
#include <vector>

int minCost(std::vector<std::vector<int>>& costs) {
    if (costs.size() == 0) {
        return 0;
    }
    auto weights = costs;
    auto size = costs.size();
    
    for (auto i = 1; i < size; i++) {
        weights[i][0] += std::min(weights[i - 1][1], weights[i - 1][2]);
        weights[i][1] += std::min(weights[i - 1][0], weights[i - 1][2]);
        weights[i][2] += std::min(weights[i - 1][0], weights[i - 1][1]);
    }
    auto last = size - 1;
    return std::min(weights[last][0], std::min(weights[last][1], weights[last][2]));
}

int main() {
    return 0;
}
