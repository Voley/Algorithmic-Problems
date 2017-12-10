#include <iostream>
#include <vector>

class Point {
public:
    int row;
    int col;
    
    Point(int r, int c) {
        row = r;
        col = c;
    }
};

Point* findInMatrix(const std::vector<std::vector<int>>& matrix, int value) {
    
    if (matrix.size() == 0) {
        return nullptr;
    }
    
    if (matrix[0].size() == 0) {
        return nullptr;
    }
    
    int row = 0;
    int col = matrix.size() - 1;
    while (row < matrix.size() && col >= 0) {
        if (matrix[row][col] == 0) {
            return new Point(row, col);
        }
        if (matrix[row][col] < value) {
            row++;
            continue;
        }
        if (matrix[row][col] > value) {
            col--;
            continue;
        }
    }
    return NULL;
}

int main() {
    return 0;
}

