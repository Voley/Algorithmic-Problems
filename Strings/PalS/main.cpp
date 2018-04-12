#include <iostream>
#include <string>


int countSubstrings(std::string s) {
    int result = s.size();
    
    // create a center and find palindromes around it
    
    for (float center = 0.5; center < s.size(); center += 0.5) {
        int left = int(center - 0.5);
        int right = int(center + 1);
        
        while (left >= 0 && right < s.size() && s[left--] == s[right++]) {
            result++;
        }
    }
    return result;
}

int main() {
    
    std::cout << countSubstrings("abbaabba") << std::endl;
    
    return 0;
}
