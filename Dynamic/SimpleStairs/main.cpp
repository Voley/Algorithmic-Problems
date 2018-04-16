#include <iostream>
#include <vector>

int stairs(int n) {
    auto memo = std::vector<int>(n + 1, 0);
    memo[1] = 1;
    memo[2] = 2;
    if (n < 3) {
        return memo[n];
    }
    for (int i = 3; i <= n; ++i) {
        memo[i] = memo[i - 1] + memo[i - 2];
    }
    return memo[n];
}

int main() {
    std::cout << stairs(3) << std::endl;
    std::cout << stairs(10) << std::endl;
    return 0;
}
