#include <iostream>

int hammingWeight(unsigned int a) {
    int count = 0;
    while (a > 0) {
        count++;
        a &= (a - 1);
    }
    return count;
}

int main() {
    std::cout << hammingWeight(156) << std::endl;
    return 0;
}
