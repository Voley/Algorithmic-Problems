#include <iostream>
#include <unordered_map>

bool canConstruct(std::string ransomNote, std::string magazine) {
    std::unordered_map<char, int> dict;
    for (auto ch: magazine) {
        dict[ch] += 1;
    }
    
    for (auto ch: ransomNote) {
        if (dict[ch] > 0) {
            dict[ch]--;
        } else {
            return false;
        }
    }
    return true;
}

int main() {
    std::cout << canConstruct("ab", "abc") << std::endl;
    return 0;
}
