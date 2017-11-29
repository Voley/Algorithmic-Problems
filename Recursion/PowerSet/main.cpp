#include <iostream>
#include <vector>
#include <algorithm>

std::vector<int> setFromNumber(int number, std::vector<int> set);

std::vector<std::vector<int>> allSubsets(std::vector<int> set) {
    std::vector<std::vector<int>> result;
    int total = 1 << set.size();
    
    for (int i = 0; i < total; i++) {
        result.push_back(setFromNumber(i, set));
    }
    return result;
}

std::vector<int> setFromNumber(int number, std::vector<int> set) {
    std::vector<int> result;
    int index = 0;
    while (number > 0) {
        if (number & 1) {
            result.push_back(set[index]);
        }
        number >>= 1;
        index++;
    }
    return result;
}

template <typename T>
void printVector(std::vector<std::vector<T>> vec) {
    for (auto top: vec) {
        std::cout << "[";
        for (auto i: top) {
            std::cout << i;
            if (i != top.back()) {
                std::cout << ",";
            }
        }
        std::cout << "]";
        if (top != vec.back()) {
            std::cout << " ";
        }
    }
    std::cout << std::endl;
}

int main() {
    std::vector<int> set {1, 2, 3, 4};
    auto result = allSubsets(set);
    printVector(result);
    return 0;
}
