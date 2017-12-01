#include <iostream>
#include <string>
#include <vector>
#include <unordered_set>

using namespace std;

vector<string> permute(string str);
void permuteHelper(int n, vector<char>& buffer, unordered_set<string>& result);

vector<string> permute(string str) {
    unordered_set<string> result;
    vector<char> buffer {str.begin(), str.end()};
    permuteHelper(str.length(), buffer, result);
    return vector<string>(result.begin(), result.end());
}

void permuteHelper(int n, vector<char>& buffer, unordered_set<string>& result) {
    if (n == 1) {
        result.insert(string(buffer.begin(), buffer.end()));
        return;
    }
    
    for (int i = 0; i < n - 1; i++) {
        permuteHelper(n - 1, buffer, result);
        std::swap(buffer[n - 1], (n % 2) == 1 ? buffer[0] : buffer[i]);
    }
    permuteHelper(n - 1, buffer, result);
}

int main() {
    auto vec = permute("abaaa");
    for (auto i: vec) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    return 0;
}

