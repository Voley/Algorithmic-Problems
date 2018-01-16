#include <iostream>
#include <vector>
#include <unordered_set>

int longestSequence(std::vector<int> nums) {
    std::unordered_set<int> set(nums.begin(), nums.end());
    int longest = 0;
    for (int value: set) {
        if (set.count(value - 1) == 0) {
            int temp = value + 1;
            int current = 1;
            while (set.count(temp) > 0) {
                temp++;
                current++;
            }
            longest = std::max(longest, current);
        }
    }
    return longest;
}

int main() {
    std::cout << longestSequence({300, 299, 1, 301, 2, 3, 302}) << std::endl;
    return 0;
}
