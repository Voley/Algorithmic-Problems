#include <iostream>
#include <vector>

int maxProfit(std::vector<int>& prices) {
    int minimum = INT_MAX;
    int profit = 0;
    
    for (const auto& item:prices) {
        if (item < minimum) {
            minimum = item;
        } else {
            profit = std::max(profit, item - minimum);
        }
    }
    return profit;
}

int main() {
    std::vector<int> prices { 7, 1, 5, 3, 6, 4 };
    std::cout << maxProfit(prices) << std::endl;
    return 0;
}
