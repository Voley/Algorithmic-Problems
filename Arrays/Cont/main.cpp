#include <iostream>
#include <vector>

int maxSequenceSize(const std::vector<int>& vec) {
    int max = 0;
    int running = 0;
    for (const int& i: vec) {
        running += i;
        max = std::max(max, running);
        running = std::max(running, 0);
    }
    return max;
}

int main() {
    std::cout << maxSequenceSize({2, -8, 3, -2, 4, -10}) << std::endl;
    return 0;
}
