#include <iostream>
#include <vector>

class Listy {
    std::vector<int> storage;
    
public:
    
    Listy() {
        storage = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
    }
    
    int elementAtIndex(int index) {
        if (index < storage.size()) {
            return storage[index];
        }
        return -1;
    }
    
    int search(int value) {
        
        int low = 0;
        int high = 1;
        
        while (elementAtIndex(high) < value && elementAtIndex(high) != -1) {
            high *= 2;
        }
        
        while (high >= low) {
            int mid = high - (high - low) / 2;
            int found = elementAtIndex(mid);
            if (found == value) {
                return mid;
            } else if (found > value || found == -1) {
                high = mid - 1;
            } else if (found < value) {
                low = mid + 1;
            }
        }
        return -1;
    }
};

int main() {
    auto l = Listy();
    std::cout << l.search(3) << std::endl;
    return 0;
}
