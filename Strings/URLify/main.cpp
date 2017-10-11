
//  main.cpp

#include <iostream>
#include <map>
#include <string>

std::string& urlify(std::string& str);

int main() {
    
    std::string myString = "Hello, world!";
    std::cout << urlify(myString) << std::endl;
    
    return 0;
}

std::string& urlify(std::string& str) {
    
    int counter = 0;
    
    for (char c: str) {
        if (c == ' ') {
            counter++;
        }
    }
    
    int oldSize = str.size();
    int newSize = oldSize + counter * 2;
    str.resize(newSize);
    
    int oldStringCounter = oldSize - 1;
    int newStringCounter = newSize - 1;
    
    for (; oldStringCounter > 0; --oldStringCounter) {
        
        if (str[oldStringCounter] == ' ') {
            str[newStringCounter] = '0';
            str[newStringCounter - 1] = '2';
            str[newStringCounter - 2] = '%';
            newStringCounter -= 2;
        } else {
            str[newStringCounter] = str[oldStringCounter];
        }
        newStringCounter--;
    }
    return str;
}
