#include <iostream>
#include <vector>

bool validWordSquare(std::vector<std::string>& words) {    
    for (int i = 0; i < words.size(); i++) {
        for (int j = 0; j < words[i].size(); j++) {
            if (j >= words.size() || words[j].size() <= i || words[j][i] != words[i][j]) {
                return false;
            }
        }
    }
    return true;
}

int main() {
    return 0;
}
