#include <iostream>
#include <cstdlib>
#include <vector>

std::vector<int> randomElements(int m, const std::vector<int>& nums) {
    std::vector<int> result;
    for (int i = 0; i < m; i++) {
        result.push_back(nums[i]);
    }
    srand(time(0));
    for (int i = m; i < nums.size(); i++) {
        int k = rand() % nums.size();
        if (k < m) {
            result[k] = nums[i];
        }
    }
    return result;
}

int main() {
    auto result = randomElements(3, {1, 2, 3, 4, 5, 6, 7, 8, 9, 10});
    for (auto i: result) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    return 0;
}
