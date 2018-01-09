#include <iostream>

int read4(char *buf) {
    return 0;
}

int read(char *buf, int n) {
    char *temp = (char *)malloc(sizeof(char) * 4);
    int total = 0;
    int tail = 0;
    while (total < n) {
        int res = read4(temp);
        for (int i = 0; i < res; i++) {
            buf[tail++] = temp[i];
            total++;
            if (total == n) {
                break;
            }
        }
        if (res < 4) {
            break;
        }
    }
    return total;
}

int main() {
    return 0;
}
