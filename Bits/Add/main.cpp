#include <iostream>

int sum(int a, int b) {
    if (a == 0) {
        return b;
    }
    if (b == 0) {
        return a;
    }
    int carry = (a & b) << 1;
    int answer = a ^ b;
    return sum(answer, carry);
}

int main() {
    std::cout << sum(7, 7) << std::endl;
    return 0;
}
