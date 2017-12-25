#include <iostream>
#include <vector>
#include <cmath>

int addDigits(int n) {
    return 1 + (n - 1) % 9;
}

int main() {
    std::cout << addDigits(123) << std::endl;
    return 0;
}
