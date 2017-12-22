#include <iostream>

int negate(int a) {
    int result = 0;
    int sign = a > 0 ? -1 : 1;
    while (a != 0) {
        result += sign;
        a += sign;
    }
    return result;
}

int substract(int a, int b) {
    return a + negate(b);
}

int multiply(int a, int b) {
    if (a < b) {
        return multiply(b, a);
    }
    int sum = 0;
    for (int i = 0; i < std::abs(b); i++) {
        sum += a;
    }
    
    if (b < 0) {
        sum = negate(sum);
    }
    return sum;
}

int divide(int a, int b) {
    if (b == 0) {
        return -31337;
    }
    int absA = std::abs(a);
    int absB = std::abs(b);
    
    int product = 0;
    int x = 0;
    
    while (product + absB <= absA) {
        product += absB;
        x++;
    }
    if ((a < 0 && b < 0) || (a > 0 && b > 0)) {
        return x;
    }
    return negate(x);
}

int main() {
    std::cout << multiply(5, 10) << std::endl;
    std::cout << divide(10, 2) << std::endl;
    return 0;
}
