//
//  main.cpp
//  IsUnique

#include <iostream>
#include <map>

bool isUnique(std::string str);

int main() {
    
    std::cout << isUnique("123") << std::endl;
    std::cout << isUnique("1231") << std::endl;
    
    return 0;
}

bool isUnique(std::string str) {
    
    std::map<char, bool> myMap;
    
    for (char c: str) {
        if (myMap.count(c) > 0) {
            return false;
        }
        myMap[c] = true;
    }
    
    return true;
}
