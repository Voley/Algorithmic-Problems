#include <iostream>
#include <vector>

std::vector<int> productExceptSelf(std::vector<int>& nums) {
    std::vector<int> result(nums.size(), 1);
    int left = 1;
    int right = 1;
    for (int i = 0, j = nums.size() - 1; i < nums.size() - 1; i++, j--) {
        left *= nums[i];
        right *= nums[j];
        result[i + 1] *= left;
        result[j - 1] *= right;
    }
    return result;
}

int main() {
    return 0;
}
