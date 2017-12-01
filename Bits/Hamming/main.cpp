#include <iostream>

int hammingDistance(int x, int y) {
    int value = 0;
    int temp = x ^ y;
    while (temp > 0) {
        if ((temp & 1) > 0) {
            value++;
        }
        temp >>= 1;
    }
    return value;
}

int main() {
    std::cout << "Hamming distance between 3 and 12 is " << hammingDistance(3, 12) << std::endl;
    return 0;
}
