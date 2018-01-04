#include <iostream>
#include <cmath>

bool powerOfTwo(int i) {
    return i > 0 && ((i & (i - 1)) == 0);
}

int main() {
    std::cout << powerOfTwo(64) << std::endl;
    return 0;
}
