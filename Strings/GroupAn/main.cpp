#include <iostream>
#include <vector>
#include <unordered_map>

std::vector<std::vector<std::string>> groupAnagrams(std::vector<std::string>& strs) {
    std::unordered_map<std::string, std::vector<std::string>> dict;
    for (auto s: strs) {
        auto sorted = s;
        std::sort(sorted.begin(), sorted.end());
        dict[sorted].push_back(s);
    }
    
    std::vector<std::vector<std::string>> result;
    for (const auto& keyValue: dict) {
        result.push_back(keyValue.second);
    }
    return result;
}
int main() {
    return 0;
}

