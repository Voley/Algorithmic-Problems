#include <iostream>

int pow5(int i);
int fZeros(int i) {
    int count = 0;
    for (int j = 1; j < i; j++) {
        if (j % 5 == 0) {
            count += pow5(j);
        }
    }
    return count;
}

int pow5(int i) {
    int counter = 0;
    while (i % 5 == 0) {
        counter += 1;
        i /= 5;
    }
    return counter;
}

int main() {
    std::cout << fZeros(19) << std::endl;
    return 0;
}
