#include <iostream>
#include <vector>
#include <cmath>

std::vector<int> constructRectangle(int area) {
    int first = (int)std::sqrt(area);
    while (area % first > 0) {
        first--;
    }
    return {area / first, first};
}

int main() {
    return 0;
}
