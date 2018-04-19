#include <iostream>
#include <vector>

using std::vector;
using std::string;

// a - vertical
// b - horizontal
int longestSubsequence(string a, string b) {
    
    vector<vector<int>> memo = vector<vector<int>>(a.size() + 1, vector<int>(b.size() + 1, 0));
    
    for (int i = 1; i <= a.size(); i++) {
        for (int j = 1; j <= b.size(); j++) {
            // if they match
            if (a[i - 1] == b[j - 1]) {
                memo[i][j] = 1 + memo[i-1][j-1];
            } else {
                // they do not match
                memo[i][j] = std::max(memo[i-1][j], memo[i][j-1]);
            }
        }
    }
    return memo[a.size()][b.size()];
}

int main() {
    std::cout << longestSubsequence("abc", "b") << std::endl;
    std::cout << longestSubsequence("abc", "axxbyca") << std::endl;
    std::cout << longestSubsequence("abc", "cba") << std::endl;
    return 0;
}
