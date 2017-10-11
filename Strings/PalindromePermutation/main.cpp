
//  main.cpp

#include <iostream>
#include <map>
#include <string>

bool isPalindrome(const std::string& str);

int main() {
    
    std::string myString1 = "Hello, world!";
    std::string myString2 = "Hello, Hello";
    std::string myString3 = "zx xz";
    std::string myString4 = " ";
    std::string myString5 = "";
    std::string myString6 = "abbybbya";
    
    std::cout << "Is \"" << myString1 << "\" a palindrome? " << isPalindrome(myString1) << std::endl;
    std::cout << "Is \"" << myString2 << "\" a palindrome? " << isPalindrome(myString2) << std::endl;
    std::cout << "Is \"" << myString3 << "\" a palindrome? " << isPalindrome(myString3) << std::endl;
    std::cout << "Is \"" << myString4 << "\" a palindrome? " << isPalindrome(myString4) << std::endl;
    std::cout << "Is \"" << myString5 << "\" a palindrome? " << isPalindrome(myString5) << std::endl;
    std::cout << "Is \"" << myString6 << "\" a palindrome? " << isPalindrome(myString6)  << std::endl;
    
    std::cout << std::endl;
    
    return 0;
}

int count_bits(int n) {
    int count = 0;
    while(n != 0) {
        n &= (n-1);
        count++;
    }
    return count;
}

bool isPalindrome(const std::string& str) {
    int result = 0;
    
    for (char c: str) {
        result ^= 1 << (int)c;
    }
    
    if (str.size() % 2 != 0 && count_bits(result) == 1) {
        return true;
    }
    
    if (result != 0) {
        return false;
    }
    
    return true;
}

