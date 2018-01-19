#include <iostream>
#include <vector>
#include <unordered_set>
#include <unordered_map>

bool areSentencesSimilar(std::vector<std::string>& words1, std::vector<std::string>& words2, std::vector<std::pair<std::string, std::string>> pairs) {
    if (words1.size() != words2.size()) {
        return false;
    }
    
    std::unordered_map<std::string, std::unordered_set<std::string>> table;
    for (const auto& p: pairs) {
        table[p.first].insert(p.second);
        table[p.second].insert(p.first);
    }
    
    for (int i = 0; i < words1.size(); i++) {
        auto f = words1[i];
        auto s = words2[i];
        if (table[f].count(s) == 0 && f != s) {
            return false;
        }
    }
    return true;
}

int main() {
    return 0;
}
