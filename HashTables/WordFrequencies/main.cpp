#include <iostream>
#include <vector>
#include <unordered_map>
#include <string>
#include <algorithm>

std::unordered_map<std::string, int> generateMap(std::vector<std::string>& words) {
    std::unordered_map<std::string, int> map;
    for (auto& word: words) {
        std::string w = word;
        std::transform(word.begin(), word.end(), w.begin(), ::tolower);
        map[w]++;
    }
    return map;
}

int frequency(std::string word, std::unordered_map<std::string, int>& map) {
    std::string w = word;
    std::transform(word.begin(), word.end(), w.begin(), ::tolower);
    return map[w];
}

int main() {
    std::vector<std::string> vec {"hello", "there", "sweet", "kid", "There"};
    auto map = generateMap(vec);
    std::cout << frequency("There", map) << std::endl;
}
