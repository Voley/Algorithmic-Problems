
//  main.cpp
//  IsUnique

#include <iostream>
#include <map>
#include <string>

bool isPermutation(const std::string& first, const std::string& second);

int main() {
    
    std::cout << isPermutation("hello", "ehlol") << std::endl;
    std::cout << isPermutation("First", "striF") << std::endl;
    std::cout << isPermutation("123 ", "32 2") << std::endl;
    std::cout << isPermutation("666 ", "555") << std::endl;
    
    return 0;
}

bool isPermutation(const std::string& first, const std::string& second) {
    
    if (first.length() != second.length()) {
        return false;
    }
    
    char* array = new char[256];
    
    for (const char& c: first) {
        array[c] = ++array[c];
    }
    
    for (const char& c: second) {
        if (array[c] <= 0) {
            return false;
        } else {
            array[c] = --array[c];
        }
    }
    return true;
}
