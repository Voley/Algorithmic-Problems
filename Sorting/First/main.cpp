#include <iostream>

int isBadVersion(int ver) {
    if (ver > 100) {
        return true;
    }
    return false;
}

int firstBadVersion(int n) {
    int low = 0;
    int high = n;
    
    while (high >= low) {
        int mid = high - (high - low) / 2;
        if (isBadVersion(mid)) {
            high = mid -1;
        } else {
            low = mid + 1;
        }
    }
    return high + 1;
}

int main() {
    
    std::cout << firstBadVersion(1501) << std::endl;
    
    return 0;
}
