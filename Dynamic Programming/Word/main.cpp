#include <iostream>
#include <vector>
#include <unordered_set>


bool wordBreak(std::string s, std::vector<std::string>& wordDict) {
    std::unordered_set<std::string> words(wordDict.begin(), wordDict.end());
    std::vector<bool> memo(s.size() + 1, false);
    memo[0] = true;
    for (int i = 1; i <= s.size(); i++) {
        for (int j = 0; j < i; j++) {
            if (memo[j] && words.count(s.substr(j, i-j)) > 0) {
                memo[i] = true;
                break;
            }
        }
    }
    return memo[s.size()];
}

int main() {

    return 0;
}
