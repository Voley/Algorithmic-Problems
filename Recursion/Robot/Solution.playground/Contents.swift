/*
 Robot in a Grid
    Imagine a robot sitting on the upper left corner of grid with `r` rows and `c` columns. The robot can only move in two directions, right and down, but certain cells are "off limits" such that the robot cannot step on them. Design an algorithm to find a path for the robot from the top left to the bottom right.
*/


func findPath(_ availableGrid: [[Bool]], _ start: Point, _ end: Point) -> [Point] {
    var memoSet = Set<Point>()
    return recursivePath(availableGrid, start, end, &memoSet)
}

func recursivePath(_ availableGrid: [[Bool]], _ start: Point, _ end: Point, _ visited: inout Set<Point>) -> [Point] {
    
    if start.x < 0 || start.x > availableGrid[0].count - 1 ||
        start.y < 0 || start.y > availableGrid.count - 1 ||
        !availableGrid[start.y][start.x] ||
        visited.contains(end) {
        return []
    }
    
    visited.insert(start)
    
    if start == end {
        return [start]
    }
    
    let right = recursivePath(availableGrid, Point(start.x + 1, start.y), end, &visited)
    let down = recursivePath(availableGrid, Point(start.x, start.y + 1), end, &visited)
    
    if right.count > 0 {
        return [start] + right
    } else if down.count > 0 {
        return [start] + down
    }
    
    return []
}

struct Point: Hashable, CustomStringConvertible {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    static func == (_ lhs: Point, _ rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    var hashValue: Int {
        return (x + y) ^ 31337
    }
    
    var description: String {
        return "P:\(x):\(y)"
    }
}


var grid = [[true, true, true, true, true],
            [true, true, true, false, false],
            [true, true, true, false, true],
            [true, true, true, true, true],
            [true, true, true, true, true]]

print(findPath(grid, Point(0, 0), Point(4, 4)))
