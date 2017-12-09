#include <iostream>
#include <vector>
#include <cstdint>

class BitVector {
    std::vector<int32_t> storage;
    int32_t setBit(int32_t position, int32_t inValue) {
        int32_t mask = 1 << position;
        return inValue | mask;
    }
    
    int getBit(int32_t position, int32_t inValue) {
        int32_t mask = 1 << position;
        return (inValue & mask) > 0;
    }
    
    public:
    int size;
    BitVector(int s) {
        size = s;
        storage.resize(s);
    }
    
    void setValue(int32_t value) {
        int32_t item = storage[32 / value];
        int32_t pos = value % 32;
        int32_t val = setBit(pos, item);
        storage[32 / value] = val;
    }
    
    int contains(int32_t value) {
        int32_t item = storage[32 / value];
        int32_t pos = value % 32;
        return getBit(pos, item);
    }
};

int main() {
    BitVector vec = BitVector(100);
    vec.setValue(5);
    vec.setValue(42);
    
    std::cout << "Vector contains 1? " << vec.contains(1) << std::endl;
    std::cout << "Vector contains 5? " << vec.contains(5) << std::endl;
    std::cout << "Vector contains 42? " << vec.contains(42) << std::endl;
    std::cout << "Vector contains 77? " << vec.contains(77) << std::endl;

    return 0;
}


