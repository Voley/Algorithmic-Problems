#include <iostream>
#include <vector>
#include <cmath>

int knows(int a, int b);
int findCelebrity(int n);
int verify(int a, int n);

int knows(int a, int b) {
    return 0;
}

int findCelebrity(int n) {
    int a = 0;
    int b = n - 1;
    
    while (a != b && a < b) {
        if (knows(a, b)) {
            a++;
        } else if (knows(b, a)) {
            b--;
        } else {
            a++;
            b--;
        }
    }
    return verify(a, n);
}

int verify(int a, int n) {
    for (int i = 0; i < n; i++) {
        if (i == a) {
            continue;
        }
        if (knows(a, i) || !knows(i, a)) {
            return -1;
        }
    }
    return a;
}

int main() {
    return 0;
}
