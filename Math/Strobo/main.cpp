#include <iostream>
#include <unordered_map>

bool isStrobogrammatic(const std::string num) {
    std::unordered_map<char, char> table {{'6', '9'}, {'0', '0'}, {'9', '6'}, {'1', '1'}, {'8', '8'}};
    
    for (int i = 0; i < num.size(); i++) {
        char back = num[num.size() - 1 - i];
        if (table[num[i]] != back) {
            return false;
        }
    }
    return true;
}

int main() {
    std::cout << isStrobogrammatic("6969") << std::endl;
    return 0;
}
