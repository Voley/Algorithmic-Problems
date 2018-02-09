#include <iostream>
#include <vector>
#include <unordered_map>

int helper(std::unordered_map<int, int>& memo, std::vector<int>& cost, int n);

int minCostClimbingStairs(std::vector<int>& cost) {
    std::unordered_map<int, int> memo;
    return helper(memo, cost, cost.size());
}

int helper(std::unordered_map<int, int>& memo, std::vector<int>& cost, int n) {
    if (n < 0) {
        return 0;
    }
    if (memo.count(n) > 0) {
        return memo[n];
    }
    int addition = n >= cost.size() ? 0 : cost[n];
    memo[n] = addition + std::min(helper(memo, cost, n - 1), helper(memo, cost, n - 2));
    return memo[n];
}

int main() {
    return 0;
}
