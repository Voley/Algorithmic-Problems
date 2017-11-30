#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<string> permute(string str);
void permuteHelper(int n, vector<char>& buffer, vector<string>& result);

vector<string> permute(string str) {
    vector<string> result;
    vector<char> buffer {str.begin(), str.end()};
    permuteHelper(str.length(), buffer, result);
    return result;
}

void permuteHelper(int n, vector<char>& buffer, vector<string>& result) {
    if (n == 1) {
        result.push_back(string(buffer.begin(), buffer.end()));
        return;
    }
    
    for (int i = 0; i < n - 1; i++) {
        permuteHelper(n - 1, buffer, result);
        std::swap(buffer[n - 1], (n % 2) == 1 ? buffer[0] : buffer[i]);
    }
    permuteHelper(n - 1, buffer, result);
}

int main() {
    
    auto vec = permute("abcd");
    for (auto i: vec) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    
    return 0;
}

