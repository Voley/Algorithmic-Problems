#include <iostream>
#include <cmath>

int rand5() {
    return arc4random_uniform(5);
}

int rand7() {
    int result = 0;
    do {
        result = rand5() * 5 + rand5();
    } while (result > 21);
    return result % 7;
}

int main() {
    std::cout << rand7() << std::endl;
    return 0;
}
