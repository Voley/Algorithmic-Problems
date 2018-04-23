#include <iostream>
#include <vector>

using std::string;
using std::vector;

int longestSubstring(string a, string b) {
    if (a.size() == 0 || b.size() == 0) {
        return 0;
    }
    auto memo = vector<vector<int>>(a.size() + 1, vector<int>(b.size() + 1, 0));
    int max = 0;
    
    for (int i = 1; i <= a.size(); i++) {
        for (int j = 1; j <= b.size(); j++) {
            if (a[i] == b[j]) {
                memo[i][j] = memo[i-1][j-1] + 1;
                max = std::max(max, memo[i][j]);
            } else {
                memo[i][j] = 0;
            }
        }
    }
    return max;
}

int main() {
    std::cout << longestSubstring("abdef", "aaefaa") << " ";
    std::cout << longestSubstring("", "aaefaa") << " ";
    std::cout << longestSubstring("abdef", "zxcy") << std::endl;
    return 0;
}
