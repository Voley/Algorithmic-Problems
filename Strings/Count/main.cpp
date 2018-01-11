#include <iostream>
#include <unordered_set>
#include <vector>

std::string countAndSay(int n) {
    if (n == 1) {
        return "1";
    }
    std::string result {"1"};
    for (int i = 1; i <n; i++) {
        std::string temp;
        int count = 1;
        char prev = result[0];
        for (int j = 1; j < result.size(); j++) {
            const char next = result[j];
            if (prev != next) {
                temp += std::to_string(count);
                temp += prev;
                count = 1;
                prev = next;
            } else {
                count++;
            }
        }
        temp += std::to_string(count);
        temp += prev;
        result = temp;
    }
    return result;
}

int main() {
    std::cout << countAndSay(4) << std::endl;
    return 0;
}
