#include <iostream>
#include <vector>
#include <algorithm>

int magicIndexRecursive(std::vector<int>& nums, int low, int high);

int magicIndex(std::vector<int>& nums) {
    return magicIndexRecursive(nums, 0, nums.size() - 1);
}

int magicIndexRecursive(std::vector<int>& nums, int low, int high) {
    if (low > high) {
        return -1;
    }
    int mid = high - (high - low) / 2;
    if (nums[mid] == mid) {
        return mid;
    }
    
    int leftIndex = std::min(mid - 1, nums[mid]);
    int left = magicIndexRecursive(nums, low, leftIndex);
    if (left != -1) {
        return left;
    }
    
    int rightIndex = std::max(mid + 1, nums[mid]);
    int right = magicIndexRecursive(nums, rightIndex, high);
    return right;
}

int main() {
    
    std::vector<int> vec {-10, -5, 2, 2, 2, 3, 4, 7, 9, 12, 13};
    std::cout << magicIndex(vec) << std::endl;
    return 0;
}

