#include <iostream>
#include <vector>
#include <unordered_map>
#include <cmath>

bool isLetter(char c);
bool isDigit(char c);

std::vector<int> buildDiff(std::vector<char> vec) {
    int delta = 0;
    std::vector<int> result;
    for (char c: vec) {
        if (isDigit(c)) {
            delta++;
        } else if (isLetter(c)) {
            delta--;
        }
        result.push_back(delta);
    }
    return result;
}

std::pair<int, int> longestMatch(std::vector<int> diff) {
    std::unordered_map<int, int> map;
    std::pair<int, int> pair {0, 0};
    
    for (int i = 0; i < diff.size(); i++) {
        int value = diff[i];
        if (map.count(value) > 0) {
            int match = map[value];
            int distance = std::abs(match - i);
            int longest = pair.first - pair.second;
            if (distance > longest) {
                pair = {match, i};
            }
        } else {
            map[value] = i;
        }
    }
    return pair;
}

std::vector<char> findLongestSequence(std::vector<char> chars) {
    auto diff = buildDiff(chars);
    auto pair = longestMatch(diff);
    std::vector<char> result;
    for (int i = pair.first + 1; i <= pair.second; i++) {
        result.push_back(chars[i]);
    }
    return result;
}

bool isLetter(char c) {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
}

bool isDigit(char c) {
    return c >= '0' && c <= '9';
}

int main() {
    std::vector<char> chars {'a', '1', '2', '3', 'z', 'b'};
    auto vec = findLongestSequence(chars);
    for (auto c: vec) {
        std::cout << c << " ";
    }
    std::cout << std::endl;
    return 0;
}
