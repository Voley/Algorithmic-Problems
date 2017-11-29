#include <iostream>
#include <string>

void reverse(std::string& str) {
    int size = str.size();
    for (int i = 0; i < str.size() / 2; i++) {
        std::swap(str[i], str[size - 1 - i]);
    }
}

int main() {
    std::string str = "A long string";
    std::cout << "Initial string: " << str << std::endl;
    reverse(str);
    std::cout << "Reversed string: " << str << std::endl;
    return 0;
}
