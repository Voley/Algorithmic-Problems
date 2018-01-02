#include <iostream>
#include <vector>
#include <cmath>

std::vector<int> subSort(const std::vector<int>& vec) {
    if (vec.size() <= 1) {
        return {0, 0};
    }
    int i = 0;
    int j = -1;
    int left = 0;
    int right = vec.size() - 1;
    int min = INT_MAX;
    int max = INT_MIN;
    
    while (right >= 0) {
        max = std::max(vec[left], max);
        if (vec[left] != max) {
            j = left;
        }
        
        min = std::min(vec[right], min);
        if (vec[right] != min) {
            i = right;
        }
        left++;
        right--;
    }
    return {i , j};
}

int main() {
    auto result = subSort({1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19});
    for (auto i: result) {
        std::cout << i << std::endl;
    }
    return 0;
}
