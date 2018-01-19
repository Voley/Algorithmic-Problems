#include <iostream>
#include <vector>

int maxProfit(std::vector<int>& prices) {
    if (prices.size() <= 1) {
        return 0;
    }
    int max = 0;
    for (int i = 1; i < prices.size(); i++) {
        if (prices[i] > prices[i - 1]) {
            max += prices[i] - prices[i - 1];
        }
    }
    return max;
}

int main() {
    return 0;
}
