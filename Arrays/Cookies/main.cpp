#include <iostream>
#include <vector>
#include <string>

int findContentChildren(std::vector<int>& g, std::vector<int>& s) {
    std::sort(g.begin(), g.end());
    std::sort(s.begin(), s.end());
    int cookiePointer = 0;
    int total = 0;
    for (int child: g) {
        while (cookiePointer < s.size()) {
            if (s[cookiePointer] >= child) {
                total++;
                cookiePointer++;
                break;
            }
            cookiePointer++;
        }
    }
    return total;
}

int main() {
    return 0;
}
