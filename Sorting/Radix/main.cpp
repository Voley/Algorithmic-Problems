#include <iostream>
#include <vector>
#include <memory>

void radixSort(std::vector<int>& numbers) {
    int radix = 10;
    int digit = 1;
    bool done = false;
    
    while (!done) {
        done = true;
        std::vector<std::vector<int>> buckets;
        for (int i = 0; i < radix; i++) {
            buckets.push_back(std::vector<int>());
        }
        
        for (auto& number: numbers) {
            int index = number / digit;
            buckets[index % radix].push_back(number);
            
            if (done && index != 0) {
                done = false;
            }
        }
        
        int pos = 0;
        for (const auto& v: buckets) {
            for (const auto& item: v) {
                numbers[pos] = item;
                pos++;
            }
        }
        digit *= radix;
    }
}

int main() {
    std::vector<int> unsorted {10, 5, 3, 1000, 50, 49, 13, 7, 7};
    radixSort(unsorted);
    
    for (const auto& i: unsorted) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    return 0;
}
