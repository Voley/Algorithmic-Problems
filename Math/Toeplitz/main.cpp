
#include <iostream>
#include <vector>

bool isToeplitzMatrix(std::vector<std::vector<int>>& matrix) {
    auto width = matrix[0].size();
    auto height = matrix.size();
    for (int i = 1; i < height; i++) {
        for (int j = 1; j < width; j++) {
            if (matrix[i][j] != matrix[i-1][j-1]) {
                return false;
            }
        }
    }
    return true;
}

int main() {
    return 0;
}


