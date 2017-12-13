#include <iostream>
#include <string>

void reverse(char *str) {
    size_t len = strlen(str);
    for (size_t i = 0, j = len - 1; i < len / 2; i++, j--) {
        char temp = str[i];
        str[i] = str[j];
        str[j] = temp;
    }
}

int main() {
    char str[] = "Hello, world!";
    reverse(str);
    std::cout << str << std::endl;
    return 0;
}
