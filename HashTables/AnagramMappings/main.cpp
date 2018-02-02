#include <iostream>
#include <vector>
#include <unordered_map>

std::vector<int> anagramMappings(std::vector<int>& A, std::vector<int>& B) {
    std::unordered_map<int, int> mappings;
    for (int i = 0; i < B.size(); i++) {
        int num = B[i];
        mappings[num] = i;
    }
    std::vector<int>result;
    for (int num: A) {
        result.push_back(mappings[num]);
    }
    return result;
}

int main() {
    return 0;
}
