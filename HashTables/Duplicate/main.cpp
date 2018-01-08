#include <iostream>
#include <unordered_set>
#include <vector>

bool containsDuplicate(const std::vector<int>& nums) {
    std::unordered_set<int> storage;
    for (const int& n: nums) {
        if (storage.count(n) > 0) {
            return true;
        }
        storage.insert(n);
    }
    return false;
}

int main() {
    std::cout << containsDuplicate({1, 2, 3, 1}) << std::endl;
    std::cout << containsDuplicate({1, 2, 3}) << std::endl;
    return 0;
}
