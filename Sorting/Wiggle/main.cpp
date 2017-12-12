#include <iostream>
#include <vector>
#include <memory>

void wiggleSort(std::vector<int>& nums) {
    if (nums.size() == 0 || nums.size() == 1) {
        return;
    }
    
    for (int i = 1; i < nums.size(); i++) {
        if ((i % 2) == (nums[i - 1] > nums[i])) {
            std::swap(nums[i - 1], nums[i]);
        }
    }
}

int main() {
    std::vector<int> vec {1, 2, 3, 4, 5, 6};
    wiggleSort(vec);
    for (const auto& i: vec) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    return 0;
}
