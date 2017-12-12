#include <iostream>
#include <vector>
#include <memory>

int maxIndex(const std::vector<int>& vec, int a, int b, int c);

void peaks(std::vector<int>& vec) {
    
    if (vec.size() == 0 || vec.size() == 1) {
        return;
    }
    
    for (int i = 1; i < vec.size(); i += 2) {
        int largest = maxIndex(vec, i - 1, i, i + 1);
        if (vec[i] != vec[largest]) {
            std::swap(vec[i], vec[largest]);
        }
    }
}

int maxIndex(const std::vector<int>& vec, int a, int b, int c) {
    int f = a >= 0 && a < vec.size() ? vec[a] : INT_MIN;
    int s = b >= 0 && b < vec.size() ? vec[b] : INT_MIN;
    int t = c >= 0 && c < vec.size() ? vec[c] : INT_MIN;
    int largest = std::max(f, std::max(s, t));
    
    if (f == largest) {
        return a;
    } else if (s == largest) {
        return b;
    }
    return c;
}

int main() {
    std::vector<int> vec {0, 1, 1, 2, 3, 3};
    peaks(vec);
    for (const auto& i: vec) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    return 0;
}
