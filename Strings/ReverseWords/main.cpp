#include <iostream>
#include <vector>

void reverseWords(std::vector<char>& str) {
    std::reverse(str.begin(), str.end());
    for (int begin = 0, i = 0; i < str.size(); i++) {
        if (str[i] == ' ') {
            std::reverse(str.begin() + begin, str.begin() + i);
            begin = i + 1;
        } else if (i == str.size() - 1) {
            std::reverse(str.begin() + begin, str.begin() + i + 1);
        }
    }
}

int main() {
    return 0;
}
