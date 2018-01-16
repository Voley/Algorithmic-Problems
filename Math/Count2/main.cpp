#include <iostream>
#include <vector>
#include <cmath>

int count2helper(int number, int d) {
    int pow10 = pow(10, d);
    int nextPow10 = pow10 * 10;
    int right = number % pow10;
    
    int roundDown = number - number % nextPow10;
    int roundUp = roundDown + nextPow10;
    
    int digit = (number / pow10) % 10;
    if (digit < 2) {
        return roundDown / 10;
    } else if (digit == 2) {
        return roundDown / 10 + right + 1;
    } else {
        return roundUp / 10;
    }
}

int count2(int number) {
    int count = 0;
    int len = std::to_string(number).size();
    for (int digit = 0; digit < len; digit++) {
        count += count2helper(number, digit);
    }
    return count;
}

int main() {
    std::cout << count2(23) << std::endl;
    return 0;
}
