#include <iostream>
#include <vector>
#include <string>

int singleNumber(std::vector<int>& nums) {
    int result = nums[0];
    for (int i = 1; i < nums.size(); i++) {
        result ^= nums[i];
    }
    return result;
}

int main() {
    
    std::vector<int> vec;
    vec.push_back(1);
    vec.push_back(2);
    vec.push_back(3);
    vec.push_back(1);
    vec.push_back(2);
    
    std::cout << singleNumber(vec) << std::endl;
    
    return 0;
}
