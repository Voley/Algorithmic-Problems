#include <iostream>
#include <sstream>

int calculate(std::string s) {
    std::istringstream in('+' + s + '+');
    long long total = 0;
    long term = 0;
    long n = 0;
    char op;
    
    while (in>>op) {
        if (op == '+' || op == '-') {
            int sign = op == '+' ? 1 : -1;
            total += term;
            in >> term;
            term *= sign;
        } else {
            in >> n;
            if (op == '*') {
                term *= n;
            } else {
                term /= n;
            }
        }
    }
    return total;
}

int main() {
    std::cout << calculate("0 - 2 * 3") << std::endl;
    return 0;
}
