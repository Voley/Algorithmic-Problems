#include <iostream>
#include <vector>
#include <cmath>

bool increasingTriplet(std::vector<int>& nums) {
    int first = INT_MAX;
    int second = INT_MAX;
    
    for (const int& i: nums) {
        if (i <= first) {
            first = i;
        } else if (i <= second) {
            second = i;
        } else {
            return true;
        }
    }
    return false;
}

int main() {
    return 0;
}
