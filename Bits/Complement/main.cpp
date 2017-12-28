#include <iostream>

int findComplement(int num) {
    int mask = num;
    mask |= mask >> 1;
    mask |= mask >> 2;
    mask |= mask >> 4;
    mask |= mask >> 8;
    mask |= mask >> 16;
    return mask ^ num;
}

int main() {
    std::cout << findComplement(5) << std::endl;
    return 0;
}
