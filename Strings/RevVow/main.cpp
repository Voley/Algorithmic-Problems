#include <iostream>

bool isVowel(char c);

std::string reverseVowels(std::string s) {
    int begin = 0;
    int end = s.size() - 1;
    while (begin < end) {
        while (!isVowel(s[begin]) && begin < end) {
            begin++;
        }
        while (!isVowel(s[end]) && begin < end) {
            end--;
        }
        if (begin < end) {
            std::swap(s[begin], s[end]);
            begin++;
            end--;
        }
    }
    return s;
}

bool isVowel(char c) {
    return c == 'a' || c == 'e' || c == 'u' || c == 'i' || c == 'o' ||
    c == 'A' || c == 'E' || c == 'U' || c == 'I' || c == 'O';
}

int main() {
    std::cout << reverseVowels(std::string{"leetcode"}) << std::endl;
    return 0;
}
