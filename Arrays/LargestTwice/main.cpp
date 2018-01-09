#include <iostream>
#include <vector>

int dominantIndex(const std::vector<int>& nums) {
    if (nums.size() == 0) {
        return -1;
    }
    int max = nums[0];
    int index = 0;
    for (int i = 0; i < nums.size(); i++) {
        if (nums[i] > max) {
            max = nums[i];
            index = i;
        }
    }
    
    for (int i = 0; i < nums.size(); i++) {
        if (i == index) {
            continue;
        }
        if (nums[i] * 2 > max) {
            return -1;
        }
    }
    return index;
}

int main() {
    std::cout << dominantIndex({1, 2, 4}) << std::endl;
    return 0;
}
