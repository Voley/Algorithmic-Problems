#include <iostream>
#include <vector>
#include <unordered_map>

// 1 based prices

int rodHelper(int n, std::vector<int> prices, std::unordered_map<int, int> memo) {
    if (n == 0) {
        return 0;
    }
    if (memo.count(n) > 0) {
        return memo[n];
    }
    int max = 0;
    for (int i = 0; i < n; i++) {
        // take full rod from one size, empty rod on another
        int temp = prices[n - i] + rodHelper(i, prices, memo);
        if (temp > max) {
            max = temp;
        }
    }
    memo[n] = max;
    return max;
}

int maxRodCut(int n, std::vector<int> prices) {
    std::unordered_map<int, int> data;
    return rodHelper(n, prices, data);
}

int main() {
    std::cout << maxRodCut(3, {0, 1, 4, 5}) << std::endl;
    return 0;
}
