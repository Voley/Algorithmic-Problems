#include <iostream>
#include <vector>
#include <algorithm>

void hanoi(int num, std::vector<int>& from, std::vector<int>& buf, std::vector<int>& to) {
    if (num == 1) {
        int i = from.back();
        from.pop_back();
        to.push_back(i);
    } else {
        hanoi(num - 1, from, to, buf);
        hanoi(1, from, buf, to);
        hanoi(num - 1, buf, from, to);
    }
}

int main() {
    std::vector<int> f {4, 3, 2, 1};
    std::vector<int> b;
    std::vector<int> t;
    
    hanoi(4, f, b, t);
    
    for (auto it = t.begin(); it != t.end(); it++) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;
    
    return 0;
}

