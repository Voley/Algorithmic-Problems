#include <iostream>
#include <vector>
#include <string>

int shortestDistance(std::vector<std::string>& words, std::string word1, std::string word2) {
    int first = -1;
    int second = -1;
    int min = INT_MAX;
    for (int i = 0; i < words.size(); i++) {
        std::string word = words[i];
        if (word == word1) {
            first = i;
        } else if (word == word2) {
            second = i;
        }
        if (first != -1 && second != -1) {
            min = std::min(min, std::abs(first - second));
        }
    }
    return min;
}

int main() {
    return 0;
}
