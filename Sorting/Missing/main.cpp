#include <iostream>
#include <vector>
#include <iostream>
#include <vector>
#include <string>

int search(const std::vector<std::string>& strings, const std::string& str) {
    int low = 0;
    int high = strings.size() - 1;
    
    while (high >= low) {
        int mid = high - (high - low) / 2;
        
        if (strings[mid].empty()) {
            int left = mid - 1;
            int right = mid + 1;
            
            while (left >= low || right <= high) {
                if (left >= low) {
                    if (!strings[left].empty()) {
                        mid = left;
                        break;
                    }
                }
                if (right <= high) {
                    if (!strings[right].empty()) {
                        mid = right;
                        break;
                    }
                }
                left--;
                right++;
            }
        }
        
        if (strings[mid].empty()) {
            return -1;
        }
        
        if (strings[mid] == str) {
            return mid;
        } else if (strings[mid] > str) {
            high = mid - 1;
        } else if (strings[mid] < str) {
            low = mid + 1;
        }
    }
    return -1;
}

int main() {
    std::vector<std::string> strings {"abe", "", "", "", "", "joe", "", "zz"};
    std::cout << search(strings, "zz") << std::endl;
    return 0;
}

