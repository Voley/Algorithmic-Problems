/*
 Island Perimeter
    You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
*/

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var temp = grid
    var result: Int = 0
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] == 1 {
                dfsAdder(i, j, &temp, &result)
                return result
            }
        }
    }
    return result
}

func dfsAdder(_ row: Int, _ col: Int, _ grid: inout [[Int]], _ result: inout Int) {
    if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count || grid[row][col] == 0 || grid[row][col] == -1 {
        return
    }
    grid[row][col] = -1
    
    result += safeBound(row + 1, col, grid) == 0 ? 1 : 0
    result += safeBound(row - 1, col, grid) == 0 ? 1 : 0
    result += safeBound(row, col + 1, grid) == 0 ? 1 : 0
    result += safeBound(row, col - 1, grid) == 0 ? 1 : 0
    
    dfsAdder(row + 1, col, &grid, &result)
    dfsAdder(row - 1, col, &grid, &result)
    dfsAdder(row, col - 1, &grid, &result)
    dfsAdder(row, col + 1, &grid, &result)
}

func safeBound(_ row: Int, _ col: Int, _ grid: [[Int]]) -> Int {
    if row >= grid.count || row < 0 || col < 0 || col >= grid[0].count {
        return 0
    }
    return grid[row][col]
}

var temp = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
print(islandPerimeter(temp))

