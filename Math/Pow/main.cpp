#include <iostream>

double pow(double x, int n) {
    double result = 1;
    if (n < 0) {
        n *= -1;
        x = 1 / x;
    }
    while (n > 0) {
        if (n & 1) {
            result *= x;
        }
        x = x * x;
        n >>= 1;
    }
    return result;
}

int main() {
    std::cout << pow(1.41, 7) << std::endl;
    return 0;
}
