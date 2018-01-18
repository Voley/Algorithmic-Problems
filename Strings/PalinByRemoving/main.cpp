#include <iostream>

bool isPalindrome(std::string& s, int begin, int end);

bool validPalindrome(std::string s) {
    int begin = 0;
    int end = s.size() - 1;
    while (begin < end) {
        if (s[begin] != s[end]) {
            return isPalindrome(s, begin + 1, end) || isPalindrome(s, begin, end - 1);
        }
        begin++;
        end--;
    }
    return true;
}

bool isPalindrome(std::string& s, int begin, int end) {
    while (begin < end) {
        if (s[begin++] != s[end--]) {
            return false;
        }
    }
    return true;
}

int main() {
    return 0;
}
