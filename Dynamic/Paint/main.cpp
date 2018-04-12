#include <iostream>
#include <vector>

int numWays(int n, int k) {
    if (n == 0 || k == 0) {
        return 0;
    }
    std::vector<int> memo(n + 1, 0);
    for (int i = 0; i <= n; i++) {
        if (i == 0) {
            memo[i] = 0;
        } else if (i == 1) {
            memo[i] = k;
        } else if (i == 2) {
            memo[i] = k * k;
        } else {
            memo[i] = (memo[i - 1] + memo[i - 2]) * (k - 1);
        }
    }
    return memo[n];
}

int main() {
    return 0;
}
