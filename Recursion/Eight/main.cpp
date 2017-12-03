#include <iostream>
#include <string>
#include <vector>
#include <cmath>

int grid_size = 8;

bool validPosition(std::vector<int>& columns, int row1, int column1) {
    for (int row2 = 0; row2 < row1; row2++) {
        int column2 = columns[row2];
        if (column1 == column2) {
            return false;
        }
        if (row1 == row2) {
            return false;
        }
        
        int columnDistance = abs(column2 - column1);
        int rowDistance = row1 - row2;
        if (columnDistance == rowDistance) {
            return false;
        }
    }
    return true;
}

void solution(int row, std::vector<int>& columns, std::vector<std::vector<int>>& result) {
    if (row == grid_size) {
        auto cVector = columns;
        result.push_back(cVector);
    }
    
    for (int col = 0; col < grid_size; col++) {
        if (validPosition(columns, row, col)) {
            columns[row] = col;
            solution(row + 1, columns, result);
        }
    }
}



int main() {

    std::chrono::time_point<std::chrono::system_clock> start;
    std::chrono::time_point<std::chrono::system_clock> end;
    
    for (int i = 10; i <= 17; i++) {
        
        grid_size = i;
        std::vector<int> columns;
        columns.resize(grid_size);
        std::vector<std::vector<int>> result;
        
        start = std::chrono::system_clock::now();
        
        solution(0, columns, result);
        
        end = std::chrono::system_clock::now();
        
        std::chrono::duration<double> elapsed = end - start;
        
        std::cout << "Size " << grid_size << ": " << result.size() << std::endl;
        
        printf("time: %lld ns\n", std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count());
        printf("time: %lld ms\n", std::chrono::duration_cast<std::chrono::milliseconds>(elapsed).count());
        printf("time: %lld s\n", std::chrono::duration_cast<std::chrono::seconds>(elapsed).count());
    }
    
    //std::cout << "Total solutions for size " << grid_size << ": " << result.size() << std::endl;
    
    return 0;
}
