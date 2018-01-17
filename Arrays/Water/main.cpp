#include <iostream>
#include <vector>
#include <cmath>

int maxArea(std::vector<int>& height) {
    int begin = 0;
    int end = height.size() - 1;
    int max = 0;
    while (begin < end) {
        int area = (end - begin) * std::min(height[begin], height[end]);
        max = std::max(area, max);
        height[begin] > height[end] ? end-- : begin++;
    }
    return max;
}

int main() {
    std::vector<int> nums {10, 20, 1};
    std::cout << maxArea(nums) << std::endl;
    return 0;
}
