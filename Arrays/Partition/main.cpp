#include <iostream>
#include <vector>

int arrayPairSum(const std::vector<int>& nums) {
    auto copy = nums;
    std::sort(copy.begin(), copy.end());
    int sum = 0;
    for (int i = 0; i < copy.size(); i += 2) {
        sum += copy[i];
    }
    return sum;
}

int main() {
    std::cout << arrayPairSum({4, 2, 3, 1}) << std::endl;
    return 0;
}
