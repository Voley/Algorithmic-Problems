#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <unordered_map>
#include <sstream>

bool wordPattern(std::string pattern, std::string str) {
    std::vector<std::string> words;
    std::string word;
    std::istringstream iss(str, std::istringstream::in);
    while (iss >> word) {
        words.push_back(word);
    }
    
    if (pattern.length() != words.size()) {
        return false;
    }
    
    std::unordered_map<char, std::string> mc;
    std::unordered_map<std::string, char> mw;
    
    
    for (int i = 0; i < pattern.size(); i++) {
        char c = pattern[i];
        std::string w = words[i];
        
        if (!mc.count(c) && !mw.count(w)) {
            mc[c] = w;
            mw[w] = c;
        } else {
            if (mc[c] != w) {
                return false;
            }
        }
    }
    return true;
}

int main() {
    
    std::cout << wordPattern("aa", "abba abba") << std::endl;
    
    return 0;
}
