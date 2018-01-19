#include <iostream>

int titleToNumber(std::string s) {
    int total = 0;
    for(char c: s) {
        total *= 26;
        total += c - 'A' + 1;
    }
    return total;
}

int main() {
    return 0;
}
