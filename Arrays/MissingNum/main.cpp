#include <iostream>
#include <vector>

class BitInteger {
private:
    std::vector<bool> storage;
    
public:
    static const int max = 64;
    
    int fetch(int index) {
        return int {storage[BitInteger::max - 1 - index]};
    }
    
    BitInteger(int num) {
        std::vector<bool> tempStorage(BitInteger::max);
        int counter = 0;
        while (num > 0) {
            tempStorage[BitInteger::max - 1 - counter] = num % 2;
            counter++;
            num >>= 1;
        }
        storage = tempStorage;
    }
};

int missingHelper(std::vector<BitInteger>& input, int index);

int findMissing(std::vector<BitInteger>& nums) {
    return missingHelper(nums, 0);
}

int missingHelper(std::vector<BitInteger>& input, int index) {
    if (index >= BitInteger::max) {
        return 0;
    }
    std::vector<BitInteger> oneBits;
    std::vector<BitInteger> zeroBits;
    
    for (auto& i: input) {
        if (i.fetch(index) == 0) {
            zeroBits.push_back(i);
        } else {
            oneBits.push_back(i);
        }
    }
    
    if (zeroBits.size() <= oneBits.size()) {
        int v = missingHelper(zeroBits, index + 1);
        return (v << 1) | 0;
    } else {
        int v = missingHelper(oneBits, index + 1);
        return (v << 1) | 1;
    }
}

int main() {
    std::vector<BitInteger> nums {BitInteger(0), BitInteger(1), BitInteger(2), BitInteger(3), BitInteger(5), BitInteger(6), BitInteger(7), BitInteger(8), BitInteger(9)};
    std::cout << findMissing(nums) << std::endl;
    return 0;
}
