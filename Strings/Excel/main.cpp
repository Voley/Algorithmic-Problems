#include <iostream>
#include <string>
#include <vector>

std::string convertToTitle(int n) {
    std::string result;
    char tmp;
    while (n > 0) {
        n--;
        tmp = 'A' + n % 26;
        result = tmp + result;
        n /= 26;
    }
    return result;
}

int main() {
    
    std::cout << convertToTitle(27) << std::endl;
    return 0;
}
