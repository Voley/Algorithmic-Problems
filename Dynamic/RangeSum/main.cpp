#include <iostream>
#include <vector>

class NumArray {
    std::vector<int> storage;
public:
    NumArray(std::vector<int> nums) {
        for (int i = 1; i < nums.size(); i++) {
            nums[i] += nums[i - 1];
        }
        storage = nums;
    }
    
    int sumRange(int i, int j) {
        return storage[j] - storage[i - 1];
    }
};

int main() {
    return 0;
}
