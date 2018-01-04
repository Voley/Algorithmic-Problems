#include <iostream>
#include <vector>
#include <unordered_map>

std::unordered_map<std::string, std::vector<std::string>> generateMap(const std::vector<std::string>& dict) {
    std::unordered_map<std::string, std::vector<std::string>> result;
    std::unordered_map<char, char> mapping {{'a', '2'}, {'b', '2'}, {'c', '2'}, {'d', '3'}, {'e', '3'}, {'f', '3'}, {'g', '4'}, {'h', '4'}, {'i', '4'}, {'j', '5'}, {'k', '5'}, {'l', '5'}, {'m', '6'}, {'n', '6'}, {'o', '6'}, {'p', '7'}, {'q', '7'}, {'r', '7'}, {'s', '7'}, {'t', '8'}, {'u', '8'}, {'v', '8'}, {'w', '9'}, {'x', '9'}, {'y', '9'}, {'z', '9'}};
    
    for (auto& word: dict) {
        std::string temp = "";
        for (const char& c: word) {
            temp += mapping[c];
        }
        result[temp].push_back(word);
    }
    return result;
}

std::vector<std::string> wordsForNumeralRepresentation(const std::string numeral, const std::unordered_map<std::string, std::vector<std::string>> dict) {
    auto it = dict.find(numeral);
    if (it != dict.end()) {
        return it->second;
    }
    return {};
}

int main() {
    auto dict = generateMap({"hello", "there", "yo", "xo"});
    auto result = wordsForNumeralRepresentation("96", dict);
    for (auto w: result) {
        std::cout << w << std::endl;
    }
    return 0;
}
