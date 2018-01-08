#include <iostream>
#include <vector>

std::vector<std::string> fizzBuzz(int n) {
    std::vector<std::string> result;
    for (int i = 1; i <= n; i++) {
        std::string temp = "";
        if (i % 3 == 0) {
            temp += "Fizz";
        }
        if (i % 5 == 0) {
            temp += "Buzz";
        }
        if ((i % 3 != 0) && (i % 5 != 0)) {
            temp += std::to_string(i);
        }
        result.push_back(temp);
    }
    return result;
}

int main() {
    auto vec = fizzBuzz(15);
    for (auto i: vec) {
        std::cout << i << std::endl;
    }
    return 0;
}
