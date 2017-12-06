#include <iostream>
#include <vector>

int search(std::vector<int>& nums, int target) {
    int lo = 0;
    int hi = nums.size() - 1;
    
    while (hi >= lo) {
        int mid = hi - (hi - lo) / 2;
        if (nums[mid] == target) {
            return mid;
        }
        // we have a rotation
        if (nums[mid] > nums[hi]) {
            if (target < nums[mid] && target >= nums[lo]) {
                hi = mid - 1;
            } else {
                lo = mid + 1;
            }
        } else if (nums[mid] < nums[lo]) {
            if (target > nums[mid] && target <= nums[hi]) {
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        } else { // regular binary
            if (target < nums[mid]) {
                hi = mid - 1;
            } else {
                lo = mid + 1;
            }
        }
    }
    return -1;
}

int main() {
    std::vector<int> vec { 5, 6, 7, 8, 1, 2, 3};
    std::cout << search(vec, 1) << std::endl;
    return 0;
}
