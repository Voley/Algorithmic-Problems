#include <iostream>
#include <string>
#include <vector>

void generateParens(int open, int closed, std::string output, std::vector<std::string>& result);

void generateParens(int open, int closed, std::string output, std::vector<std::string>& result) {
    
    if (open == 0 && closed == 0) {
        result.push_back(output);
        return;
    }
    
    if (open) {
        generateParens(open - 1, closed, output + '(', result);
    }
    
    if (open < closed) {
        generateParens(open, closed - 1, output + ')', result);
    }
}

int main() {
    std::vector<std::string> res;
    std::string temp;
    generateParens(3, 3, temp, res);
    for (auto i: res) {
        std::cout << i << std::endl;
    }
    
    return 0;
}
