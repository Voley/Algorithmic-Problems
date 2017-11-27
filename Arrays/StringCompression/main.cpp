#include <iostream>
#include <vector>
#include <string>

int compress(std::vector<char>& chars);
void write(int sum, int& w, std::vector<char>& chars, char c);

int main() {
    std::vector<char> vec {'a', 'a', 'a', 'b', 'b'};
    std::cout << compress(vec) << std::endl;
    return 0;
}

int compress(std::vector<char>& chars) {
    int l = 0; // left
    int w = 0; // write
    int r = 0; // right
    
    for (r = 0; r <= chars.size(); r++) {
        if (r == chars.size()) {
            int sum = r - l;
            write(sum, w, chars, chars[l]);
        } else if (chars[l] != chars[r]) {
            int sum = r - l;
            write(sum, w, chars, chars[l]);
            l = r;
        }
    }
    return w;
}

void write(int sum, int& w, std::vector<char>& chars, char c) {
    chars[w++] = c;
    if (sum >= 10) {
        chars[w++] = '0' + (sum / 10);
        chars[w++] = '0' + (sum % 10);
    } else if (sum > 1) {
        chars[w++] = '0' + sum;
    }
}
