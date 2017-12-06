#include <iostream>
#include <vector>
#include <unordered_map>

std::string sortString(const std::string& str) {
    std::string c = str;
    sort(c.begin(), c.end());
    return c;
}

std::vector<std::string> groupAnagrams(std::vector<std::string>& strings) {
    std::unordered_map<std::string, std::vector<std::string>> map;
    for (const auto& str: strings) {
        auto key = sortString(str);
        map[key].push_back(str);
    }
    std::vector<std::string> result;
    for (const auto& pair: map) {
        result.insert(result.end(), pair.second.begin(), pair.second.end());
    }
    return result;
}

int main() {
    
    std::vector<std::string> vec { "aba", "zxc", "baa", "zcx", "bobby", "johnny", "nnhjoy"};
    auto v = groupAnagrams(vec);
    
    for (const auto& value: v) {
        std::cout << value << " ";
    }
    std::cout << std::endl;
    
    return 0;
}
