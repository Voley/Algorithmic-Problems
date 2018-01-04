#include <iostream>
#include <vector>
#include <unordered_map>

int firstUniqChar(std::string s) {
    std::unordered_map<char, int> chars;
    for (const char& c: s) {
        chars[c]++;
    }
    int counter = 0;
    for (const char& c: s) {
        if (chars[c] == 1) {
            return counter;
        }
        counter++;
    }
    return -1;
}

int main() {
    return 0;
}
