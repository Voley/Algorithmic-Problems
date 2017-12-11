#include <iostream>
#include <vector>

std::vector<int> findDisappearedNumbers(std::vector<int>& nums) {
    for (int i = 0; i < nums.size(); i++) {
        while ((nums[i] - 1) != i && nums[i] != nums[nums[i] - 1]) {
            std::swap(nums[i], nums[nums[i] - 1]);
        }
    }
    std::vector<int> result;
    for (int i = 0; i < nums.size(); i++) {
        if (nums[i] != i + 1) {
            result.push_back(i + 1);
        }
    }
    return result;
}

int main() {
    std::vector<int> nums { 5, 4, 3, 2, 2, 6 };
    auto res = findDisappearedNumbers(nums);
    for (const auto& i: res) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    return 0;
}
