
//  main.cpp

#include <iostream>
#include <string>

std::string compress(std::string str);

int main() {
    
    std::cout << compress("aaabbbbccdddz");
    return 0;
}

std::string compress(std::string str) {
    
    int counter = 0;
    std::string result;
    char lastCharacter = ' ';
    
    for (char c: str) {
        if (c != lastCharacter) {
            if (counter > 0) {
                result += lastCharacter;
                result += std::to_string(counter);
            }
            lastCharacter = c;
            counter = 1;
        } else {
            counter++;
        }
    }
    
    if (counter > 0) {
        result += lastCharacter;
        result += std::to_string(counter);
    }
    
    if (result.size() > str.size()) {
        result = str;
    }
    
    return result;
}
