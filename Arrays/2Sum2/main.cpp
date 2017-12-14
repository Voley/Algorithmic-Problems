#include <iostream>
#include <vector>

std::vector<int> twoSum(std::vector<int>& numbers, int target) {
    int first = 0;
    int second = numbers.size() - 1;
    
    while (first != second) {
        int sum = numbers[first] + numbers[second];
        if (sum == target) {
            return {first + 1, second + 1};
        } else if (sum > target) {
            second--;
        } else {
            first++;
        }
    }
    return {};
}

int main() {
    std::vector<int> vec {1, 2, 3, 4, 5, 6, 7, 8, 9};
    auto result = twoSum(vec, 12);
    std::cout << result[0] << " " << result[1] << std::endl;
    return 0;
}
