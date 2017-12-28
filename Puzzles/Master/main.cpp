#include <iostream>
#include <unordered_map>
#include <set>
#include <string>

struct Pair {
    int h;
    int p;
    Pair(int hits, int pseudo) {
        h = hits;
        p = pseudo;
    }
};

Pair mastermind(const std::string& query, const std::string& solution) {
    int hits = 0;
    int pseudo = 0;
    std::unordered_map<char, int> map;
    
    int i = 0;
    for (const auto& c: solution) {
        map[c] = i;
        i++;
    }
    
    std::set<char> found;
    
    i = 0;
    for (const auto& c: query) {
        if (map.count(c)) {
            if (map[c] == i) {
                hits++;
                found.insert(c);
            }
        }
        i++;
    }
    for (const auto& c: query) {
        if ((solution.find(c) != std::string::npos) && !found.count(c)) {
            pseudo++;
            found.insert(c);
        }
    }
    
    return Pair(hits, pseudo);
}

int main() {
    auto result = mastermind("RGBY", "GGRR");
    std::cout << result.h << " " << result.p << std::endl;
    return 0;
}
