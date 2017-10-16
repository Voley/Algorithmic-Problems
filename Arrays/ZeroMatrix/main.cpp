#include <iostream>
#include <vector>
#include <string>

class Matrix {
public:
    Matrix(size_t rows, size_t cols) {
        mRows = rows;
        mCols = cols;
    }
    std::vector<std::vector<int>> data;
    
    void print() {
        for ( const std::vector<int> &v : data )
        {
            for ( int x : v ) std::cout << x << ' ';
            std::cout << std::endl;
        }
    }
    
    void checkMatrix() {
        
        bool shouldClearFirstRow = false;
        bool shouldClearFirstColumn = false;
        
        // check first row
        for (int i = 0; i < mCols; i++) {
            if (data[0][i] == 0) {
                shouldClearFirstRow = true;
                break;
            }
        }
        // check first column
        for (int i = 0; i < mRows; i++) {
            if (data[i][0] == 0) {
                shouldClearFirstColumn = true;
                break;
            }
        }
        // mark rows and columns that need nullification
        for (int row = 0; row < mRows; row++) {
            for (int column = 0; column < mCols; column++) {
                if (data[row][column] == 0) {
                    data[0][column] = 0;
                    data[row][0] = 0;
                }
            }
        }
        // nullify rows
        for (int i = mRows - 1; i > 0; i--) {
            if (data[i][0] == 0) {
                nullifyRow(i);
            }
        }
        // nullify columns
        for (int i = mCols - 1; i > 0; i--) {
            if (data[0][i] == 0) {
                nullifyColumn(i);
            }
        }
        
        if (shouldClearFirstColumn) {
            nullifyColumn(0);
        }
        
        if (shouldClearFirstRow) {
            nullifyRow(0);
        }
    }
    
private:
    size_t mRows;
    size_t mCols;
    
    void nullifyRow(int row) {
        for (int i = 0; i < mCols; i++) {
            data[row][i] = 0;
        }
    }
    
    void nullifyColumn(int column) {
        for (int i = 0; i < mCols; i++) {
            data[i][column] = 0;
        }
    }
};

int main() {
    
    Matrix test = Matrix(3, 3);
    std::vector<int> first {1, 2, 3};
    std::vector<int> second {4, 0, 6};
    std::vector<int> third {7, 8, 9};
    
    test.data.push_back(first);
    test.data.push_back(second);
    test.data.push_back(third);
    
    std::cout << "Before check: " << std::endl;
    test.print();
    test.checkMatrix();
    std::cout << "After check: " << std::endl;
    test.print();
    
    return 0;
}
