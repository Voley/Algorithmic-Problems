#include <iostream>

int countSegments(std::string s) {
    char prev = ' ';
    int count = 0;
    
    for (const char& c: s) {
        if (c == ' ' && prev != ' ') {
            count++;
        }
        prev = c;
    }
    
    if (prev != ' ') {
        count++;
    }
    return count;
}

int main() {
    return 0;
}

