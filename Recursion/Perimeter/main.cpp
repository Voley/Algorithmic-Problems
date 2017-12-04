#include <iostream>
#include <vector>

using namespace std;

void dfs(int row, int col, vector<vector<int>>& grid, int *answer);
int safeBound(int row, int col, vector<vector<int>>& grid);
int islandPerimeter(vector<vector<int>>& grid);

int islandPerimeter(vector<vector<int>>& grid) {
    int answer = 0;
    for (int i = 0; i < grid.size(); i++) {
        for (int j = 0; j < grid[0].size(); j++) {
            if (grid[i][j] == 1) {
                dfs(i, j, grid, &answer);
                return answer;
            }
        }
    }
    return answer;
}

int safeBound(int row, int col, vector<vector<int>>& grid) {
    if (row < 0 || row >= grid.size() || col < 0 || col >= grid[0].size()) {
        return 0;
    }
    return grid[row][col];
}

void dfs(int row, int col, vector<vector<int>>& grid, int *answer) {
    if (row < 0 || row >= grid.size() || col < 0 || col >= grid[0].size() || grid[row][col] == 0 || grid[row][col] == -1) {
        return;
    }
    
    grid[row][col] = -1;
    
    *answer += safeBound(row + 1, col, grid) == 0 ? 1 : 0;
    *answer += safeBound(row - 1, col, grid) == 0 ? 1 : 0;
    *answer += safeBound(row, col + 1, grid) == 0 ? 1 : 0;
    *answer += safeBound(row, col - 1, grid) == 0 ? 1 : 0;
    
    dfs(row + 1, col, grid, answer);
    dfs(row - 1, col, grid, answer);
    dfs(row, col + 1, grid, answer);
    dfs(row, col - 1, grid, answer);
}

int main() {
    vector<vector<int>> vec {{{0,1,0,0},{1,1,1,0},{0,1,0,0},{1,1,0,0}}};
    std::cout << islandPerimeter(vec) << std::endl;
    return 0;
}

