#include <iostream>
#include <vector>

int maxSubarray(const std::vector<int>& vec) {
    int max = INT_MIN;
    int running = 0;
    for (const int& i: vec) {
        running += i;
        running = std::max(running, i);
        max = std::max(max, running);
    }
    return max;
}

int main() {
    std::cout << maxSubarray({-2,1,-3,4,-1,2,1,-5,4}) << std::endl;
    return 0;
}
