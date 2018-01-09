#include <iostream>
#include <vector>
#include <cmath>

int add(int a, int b) {
    while (b != 0) {
        int sum = a ^ b;
        int carry = (a & b) << 1;
        a = sum;
        b = carry;
    }
    return a;
}

int main() {
    std::cout << add(3, 21) << std::endl;
    return 0;
}
