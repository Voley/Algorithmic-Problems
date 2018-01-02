#include <iostream>
#include <vector>
#include <initializer_list>

int findUnsortedSubarray(const std::vector<int>& nums) {
    int i = 0;
    int j = -1;
    int left = 0;
    int right = nums.size() - 1;
    int min = INT_MAX;
    int max = INT_MIN;
    
    while (right >= 0) {
        max = std::max(nums[left], max);
        if (nums[left] != max) {
            j = left;
        }
        
        min = std::min(nums[right], min);
        if (nums[right] != min) {
            i = right;
        }
        left++;
        right--;
    }
    return j - i + 1;
}

int main() {
    int i = findUnsortedSubarray({2,6,4,8,10,9,15});
    std::cout << i << std::endl;
    return 0;
}
