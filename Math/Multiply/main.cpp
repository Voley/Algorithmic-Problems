#include <iostream>

int multiplyHelper(int smaller, int larger);

int multiply(int x, int y) {
    int larger = x > y ? x : y;
    int smaller = x > y ? y : x;
    return multiplyHelper(smaller, larger);
}

int multiplyHelper(int smaller, int larger) {
    if (smaller == 0) {
        return 0;
    } else if (smaller == 1) {
        return larger;
    }
    
    int c = smaller >> 1;
    int halfProd = multiplyHelper(c, larger);
    
    if (smaller % 2) {
        return halfProd + halfProd + larger;
    } else {
        return halfProd + halfProd;
    }
}

int main() {
    std::cout << multiply(7, 7) << std::endl;
    return 0;
}
