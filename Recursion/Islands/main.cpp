#include <iostream>
#include <vector>

bool visit(int row, int col, std::vector<std::vector<char>>& grid, std::vector<std::vector<bool>>& visited) {
    if (row < 0 || row >= grid.size() || col < 0 || col >= grid[0].size() || visited[row][col]) {
        return false;
    }
    visited[row][col] = true;
    if (grid[row][col] == '0') {
        return false;
    }
    visit(row + 1, col, grid, visited);
    visit(row - 1, col, grid, visited);
    visit(row, col + 1, grid, visited);
    visit(row, col - 1, grid, visited);
    return true;
}

int numIslands(std::vector<std::vector<char>>& grid) {
    if (grid.size() == 0) {
        return 0;
    }
    std::vector<std::vector<bool>> visited (grid.size(), std::vector<bool>(grid[0].size(), false));
    int count = 0;
    for (int i = 0; i < grid.size(); i++) {
        for (int j = 0; j < grid[0].size(); j++) {
            if (visit(i, j, grid, visited)) {
                count++;
            }
        }
    }
    return count;
}

int main() {
    return 0;
}
