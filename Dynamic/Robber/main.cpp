#include <iostream>
#include <vector>

int rob(std::vector<int> houses) {
    if (houses.size() == 0) {
        return 0;
    } else if (houses.size() == 1) {
        return houses.back();
    }
    auto memo = houses;
    
    for (int i = 2; i < houses.size(); i++) {
        memo[i] = std::max(memo[i - 1], houses[i] + memo[i - 2]);
    }
    return memo.back();
}

int main() {
    std::cout << rob({1, 2, 3, 4}) << std::endl;
    std::cout << rob({1, 2, 3}) << std::endl;
    std::cout << rob({5, 1, 5, 11}) << std::endl;
    return 0;
}
