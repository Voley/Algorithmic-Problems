#include <iostream>

void mySwap(int& a, int& b) {
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
}


int main() {
    int i = 1;
    int j = 100;
    std::cout << i << " " << j << std::endl;
    mySwap(i, j);
    std::cout << i << " " << j << std::endl;
    return 0;
}
