#include <iostream>
#include <vector>

char nextGreatestLetter(std::vector<char>& letters, char target) {
    int begin = 0;
    int end = letters.size() - 1;
    
    while (begin < end) {
        int mid = (begin + end) / 2;
        if (letters[mid] > target) {
            end = mid;
        } else {
            begin = mid + 1;
        }
    }
    return letters[begin] > target ? letters[begin] : letters[0];
}

int main() {
    return 0;
}
