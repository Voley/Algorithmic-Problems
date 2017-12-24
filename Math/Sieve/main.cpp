#include <iostream>
#include <vector>
#include <cmath>

int countPrimes(int n) {
    if (n <= 2) {
        return 0;
    }
    std::vector<bool> sieve;
    sieve.assign(n, true);
    int stop = sqrt(n);
    for (int i = 2; i < stop; i++) {
        if (sieve[i]) {
            for (int j = i * 2; j < n; j += i) {
                sieve[j] = false;
            }
        }
    }
    int count = 0;
    for (int i = 2; i < sieve.size(); i++) {
        if (sieve[i] == true) {
            count++;
        }
    }
    return count;
}

int main() {
    std::cout << countPrimes(1000) << std::endl;
    return 0;
}
