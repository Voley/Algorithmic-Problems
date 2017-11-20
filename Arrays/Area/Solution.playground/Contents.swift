/*
 Max Area of Island
     Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
     Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)
 */

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var result = 0
    var grid = grid
    let verticalSize = grid.count
    let horizontalSize = grid[0].count
    
    for i in 0..<verticalSize {
        for j in 0..<horizontalSize {
            let visit = visitIsland((x: j, y: i), &grid)
            result = max(visit, result)
        }
    }
    return result
}

func visitIsland(_ startingPoint: (x: Int, y: Int), _ grid: inout [[Int]]) -> Int {
    
    if grid[startingPoint.y][startingPoint.x] == -1 {
        return 0
    }
    
    if grid[startingPoint.y][startingPoint.x] == 0 {
        grid[startingPoint.y][startingPoint.x] = -1
        return 0
    }
    
    let verticalSize = grid.count
    let horizontalSize = grid[startingPoint.y].count
    grid[startingPoint.y][startingPoint.x] = -1
    
    let top = startingPoint.y - 1 >= 0 ? visitIsland((x: startingPoint.x, y: startingPoint.y - 1), &grid) : 0
    let bottom = startingPoint.y + 1 < verticalSize ? visitIsland((x: startingPoint.x, y: startingPoint.y + 1), &grid) : 0
    let left = startingPoint.x - 1 >= 0 ? visitIsland((x: startingPoint.x - 1, y: startingPoint.y), &grid) : 0
    let right = startingPoint.x + 1 < horizontalSize ? visitIsland((x: startingPoint.x + 1, y: startingPoint.y), &grid) : 0
    return 1 + top + bottom + left + right
}

let z = [[0,0,1,0,0,0,0,1,0,0,0,0,0],
         [0,0,0,0,0,0,0,1,1,1,0,0,0],
         [0,1,1,0,1,0,0,0,0,0,0,0,0],
         [0,1,0,0,1,1,0,0,1,0,1,0,0],
         [0,1,0,0,1,1,0,0,1,1,1,0,0],
         [0,0,0,0,0,0,0,0,0,0,1,0,0],
         [0,0,0,0,0,0,0,1,1,1,0,0,0],
         [0,0,0,0,0,0,0,1,1,0,0,0,0]]

print(maxAreaOfIsland(z))
