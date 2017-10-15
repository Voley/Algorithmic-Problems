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
    
    void rotate() {
        int n = (int)mRows;
        for (int layer = 0; layer < n / 2; layer++) {
            int first = layer;
            int last = n - 1 - layer;
            for (int i = first; i < last; i++) {
                int offset = i - first;
                int top = data[first][i];
                
                // left -> top
                data[first][i] = data[last - offset][first];
                
                // bottom -> left
                data[last - offset][first] = data[last][last - offset];
                
                // right -> bottom
                data[last][last - offset] = data[i][last];
                
                // top -> right
                data[i][last] = top;
            }
        }
    }
    
private:
    size_t mRows;
    size_t mCols;
};

int main() {
    
    Matrix test = Matrix(3, 3);
    std::vector<int> first {1, 2, 3};
    std::vector<int> second {4, 5, 6};
    std::vector<int> third {7, 8, 9};
    
    test.data.push_back(first);
    test.data.push_back(second);
    test.data.push_back(third);
    
    std::cout << "Before rotation: " << std::endl;
    test.print();
    std::cout << "After rotation: " << std::endl;
    test.rotate();
    test.print();
    
    return 0;
}
