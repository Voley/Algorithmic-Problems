#include <iostream>
#include <vector>
#include <unordered_map>

class Solution {
    std::unordered_map<std::string, std::string> storage;
    std::vector<char> charPool;
public:
    Solution() {
        std::string s = "qwertyuiopasdfghjklzxcvbnm1234567890";
        charPool = std::vector<char> {s.begin(), s.end()};
    }
    
    // Encodes a URL to a shortened URL.
    std::string encode(std::string longUrl) {
        std::string result = "";
        do {
            result = randomSeq();
        } while (storage.count(result) > 0);
        storage[result] = longUrl;
        return result;
    }
    
    std::string randomSeq() {
        std::string result = "";
        for (int i = 0; i < 6; i++) {
            char r = charPool[rand() % charPool.size()];
            result += r;
        }
        return result;
    }
    
    // Decodes a shortened URL to its original URL.
    std::string decode(std::string shortUrl) {
        if (storage.count(shortUrl) > 0) {
            return storage[shortUrl];
        }
        return "";
    }
};

int main() {
    Solution solution;
    std::cout << solution.decode(solution.encode("abc")) << std::endl;
    return 0;
}

