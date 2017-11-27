#include <iostream>
#include <vector>
#include <string>

int tripleStep(int n);

int main() {
    std::cout << "Triple step of 4 is " << tripleStep(4) << std::endl;
    return 0;
}

int tripleStep(int n) {
    int array[n + 1];
    array[0] = 1;
    array[1] = 2;
    array[2] = 3;
    
    for (int i = 3; i < n; i++) {
        array[i] = array[i - 1] + array[i - 2] + array[i - 3];
    }
    return array[n - 1];
}
