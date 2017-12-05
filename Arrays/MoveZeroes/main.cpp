#include <iostream>
#include <vector>

void moveZeroes(std::vector<int>& nums) {
    int write = 0;
    int read = 0;
    while (read < nums.size()) {
        if (nums[read] != 0) {
            std::swap(nums[write++], nums[read]);
        }
        read++;
    }
}

int main() {
    std::vector<int> temp {1, 0, 3, 0, 2, 0, 0, 0, 4};
    
    std::cout << "Input: ";
    for (int i = 0; i < temp.size(); i++) {
        std::cout << temp[i] << " ";
    }
    std::cout << std::endl;
    moveZeroes(temp);
    std::cout << "Output: ";
    for (int i = 0; i < temp.size(); i++) {
        std::cout << temp[i] << " ";
    }
    std::cout << std::endl;
    return 0;
}
