#include <iostream>
#include <vector>

int findLongestChain(std::vector<std::vector<int>>& pairs) {
    std::sort(pairs.begin(), pairs.end(), [](const std::vector<int>& lhs, const std::vector<int>& rhs){ return lhs.back() < rhs.back();});
    
    int current = INT_MIN;
    int count = 0;
    
    for (auto& vec: pairs) {
        if (vec.front() > current) {
            count++;
            current = vec.back();
        }
    }
    return count;
}

int main() {
    return 0;
}
