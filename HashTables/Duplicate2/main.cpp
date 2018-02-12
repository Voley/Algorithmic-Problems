#include <iostream>
#include <vector>
#include <unordered_set>

bool containsNearbyDuplicate(std::vector<int>& nums, int k) {
    std::unordered_set<int> table;
    for (int i = 0; i < nums.size(); i++) {
        if (table.count(nums[i]) > 0) {
            return true;
        }
        table.insert(nums[i]);
        if (table.size() > k) {
            table.erase(nums[i - k]);
        }
    }
    return false;
}

int main() {
    return 0;
}
