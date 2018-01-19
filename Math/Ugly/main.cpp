#include <iostream>
#include <vector>
#include <cmath>

int nthUglyNumber(int n) {
    std::vector<int> result {1};
    int i = 0;
    int j = 0;
    int k = 0;
    
    while (result.size() < n) {
        int temp = std::min(std::min(result[i] * 2, result[j] * 3), result[k] * 5);
        if (temp == result[i] * 2) {
            i++;
        }
        if (temp == result[j] * 3) {
            j++;
        }
        if (temp == result[k] * 5) {
            k++;
        }
        result.push_back(temp);
    }
    return result.back();
}

int main() {
    return 0;
}
