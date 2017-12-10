#include <iostream>
#include <vector>

class MovingAverage {
public:
    std::vector<int> storage;
    int startIndex;
    int capacity;
    int size;
    double runningSum;
    
    MovingAverage(int size) {
        capacity = 0;
        startIndex = 0;
        runningSum = 0;
        this->size = size;
    }
    
    double next(int val) {
        if (capacity + 1 > size) {
            runningSum -= storage[startIndex++];
        } else {
            capacity++;
        }
        storage.push_back(val);
        runningSum += val;
        
        return runningSum / (storage.size() - startIndex);
    }
};

int main() {
    MovingAverage obj = MovingAverage(3);
    for (int i = 1; i < 10; i++) {
        std::cout << obj.next(i) << " ";
    }
    std::cout << std::endl;
    return 0;
}
