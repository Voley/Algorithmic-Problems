#include <iostream>
#include <vector>

int guess(int n) {
    if (n == 36) {
        return 0;
    } else if (n < 36) {
        return 1;
    }
    return -1;
}

int guessNumber(int n) {
    int low = 1;
    int high = n;
    
    while (high >= low) {
        int mid = high - (high - low) / 2;
        int result = guess(mid);
        if (result == 0) {
            return mid;
        } else if (result == -1) {
            high = mid - 1;
        } else if (result == 1) {
            low = mid + 1;
        }
    }
    return -1;
}

int main() {
    std::cout << guessNumber(100) << std::endl;
    return 0;
}
