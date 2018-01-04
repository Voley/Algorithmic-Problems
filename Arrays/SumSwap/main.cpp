#include <iostream>
#include <vector>
#include <set>

int calculateTarget(std::vector<int> a, std::vector<int>b) {
    int sumA = 0;
    for (const int& i: a) {
        sumA += i;
    }
    int sumB = 0;
    for (const int& i: b) {
        sumB += i;
    }
    if ((sumA - sumB) % 2 == 0) {
        return (sumA - sumB) / 2;
    }
    return 0;
}

std::pair<int, int> sumSwap(const std::vector<int>& a, const std::vector<int>& b) {
    int target = calculateTarget(a, b);
    if (target == 0) {
        return {0, 0};
    }
    std::set<int> set(b.begin(), b.end());
    
    for (const int& i: a) {
        int toFind = i - target;
        if (set.find(toFind) != set.end()) {
            return {i, toFind};
        }
    }
    return {0, 0};
}

int main() {
    auto pair = sumSwap({1, 2, 3, 4, 5, 6, 9}, {1, 2, 3, 4, 5, 10, 7});
    std::cout << pair.first << " " << pair.second << std::endl;
    return 0;
}
