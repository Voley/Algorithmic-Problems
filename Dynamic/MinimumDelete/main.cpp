#include <iostream>
#include <vector>

using std::vector;
using std::string;

int minimumDeleteSum(string s1, string s2) { // s1 - vertical, s2 - horizontal
    auto memo = vector<vector<int>>(s1.size() + 1, vector<int>(s2.size() + 1, 0));
    
    memo[0][0] = 0;
    
    // fill the memo rows for 0 vertical and horizontal
    // when one string is empty, the ascii difference sum
    // is another string
    
    for (int i = 0; i < s2.size(); i++) {
        memo[0][1 + i] = memo[0][i] + (int)s2[i];
    }
    for (int i = 0; i < s1.size(); i++) {
        memo[1 + i][0] = (int)s1[i] + memo[i][0];
    }
    
    // fill memo table
    // if both characters are same
    // memo[i][j] = memo[i-1][j-1]
    // if different
    // memo[i][j] = min( one string + letter, another string + letter)
    
    for (int i = 1; i <= s1.size(); i++) {
        for (int j = 1; j <= s2.size(); j++) {
            if (s1[i - 1] == s2[j - 1]) {
                memo[i][j] = (int)memo[i-1][j-1];
            } else {
                memo[i][j] = (int)std::min(memo[i][j - 1] + s2[j - 1], memo[i-1][j] + s1[i - 1]);
            }
        }
    }
    
    return memo[s1.size()][s2.size()];
}
int main() {
    std::cout << minimumDeleteSum("eat", "sea") << std::endl;
    return 0;
}
