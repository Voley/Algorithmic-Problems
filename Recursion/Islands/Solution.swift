func numIslands(_ grid: [[Character]]) -> Int {
    var visited = grid
    var count = 0
    
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if visit(i, j, grid, &visited) {
                count += 1
            }
        }
    }
    return count
}

func visit(_ row: Int, _ col: Int, _ grid: [[Character]], _ visited: inout [[Character]]) -> Bool {
    if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count {
        return false
    }
    if visited[row][col] == "2" {
        return false
    }
    visited[row][col] = "2"
    if grid[row][col] == "0" {
        return false
    }
    
    _ = visit(row + 1, col, grid, &visited)
    _ = visit(row - 1, col, grid, &visited)
    _ = visit(row, col + 1, grid, &visited)
    _ = visit(row, col - 1, grid, &visited)
    
    return true
}


