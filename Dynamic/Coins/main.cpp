#include <iostream>
#include <vector>

int changeCombinations(std::vector<int> coins, int n) {
    std::vector<int>memo(n + 1, 0);
    memo[0] = 1;
    for (auto coin: coins) {
        for (int i = 1; i <= n; i++) {
            if (i >= coin) {
                memo[i] = memo[i] + memo[i-coin];
            }
        }
    }
    return memo[n];
}
int main() {
    std::cout << changeCombinations({1, 2, 3}, 4) << std::endl;
    return 0;
}
