/*
   Sorted Matrix Search
      Given an M x N matrix in which each row and each column is sorted in ascending order, write a method to find an element.
*/

struct MPoint {
    var row: Int
    var col: Int
    
    init(_ r: Int, _ c: Int) {
        row = r
        col = c
    }
    
    func inBounds(_ matrix: [[Int]]) -> Bool {
        return col >= 0 && row >= 0 && col < matrix[0].count && row < matrix.count
    }
    
    func isBefore(_ point: MPoint) -> Bool {
        return row <= point.row && col <= point.col
    }
    
    mutating func setToAverage(_ minimum: MPoint, _ maximum: MPoint) {
        row = (minimum.row + maximum.row) / 2
        col = (minimum.col + maximum.col) / 2
    }
}

func findElement(_ matrix: [[Int]], _ origin: MPoint, _ dest: MPoint, _ value: Int) -> MPoint? {
    if !origin.inBounds(matrix) || !dest.inBounds(matrix) {
        return nil
    }
    
    if matrix[origin.row][origin.col] == value {
        return origin
    } else if !origin.isBefore(dest) {
        return nil
    }
    
    var start = origin
    let diagDistance = min(dest.row - origin.row, dest.col - origin.col)
    var end = MPoint(start.row + diagDistance, start.col + diagDistance)
    var p = MPoint(0, 0)
    
    while start.isBefore(end) {
        p.setToAverage(start, end)
        if value > matrix[p.row][p.col] {
            start.row = p.row + 1
            start.col = p.col + 1
        } else {
            end.row = p.row - 1
            end.col = p.col - 1
        }
    }
    
    return partitionAndSearch(matrix, origin, dest, start, value)
}

func partitionAndSearch(_ matrix: [[Int]], _ origin: MPoint, _ dest: MPoint, _ pivot: MPoint, _ value: Int) -> MPoint? {
    let lowerLeftOrigin = MPoint(pivot.row, origin.col)
    let lowerLeftDest = MPoint(dest.row, pivot.col - 1)
    let upperRightOrigin = MPoint(origin.row, pivot.col)
    let upperRightDest = MPoint(pivot.row - 1, dest.col)
    
    let lowerLeft = findElement(matrix, lowerLeftOrigin, lowerLeftDest, value)
    if lowerLeft == nil {
        return findElement(matrix, upperRightOrigin, upperRightDest, value)
    }
    return lowerLeft
}

func findElement(_ matrix: [[Int]], _ value: Int) -> MPoint? {
    let origin = MPoint(0, 0)
    let dest = MPoint(matrix.count - 1, matrix[0].count - 1)
    return findElement(matrix, origin, dest, value)
}

let matrix = [[1, 2, 3, 4, 5],
              [2, 3, 4, 5, 6],
              [3, 4, 5, 6, 7],
              [4, 5, 6, 7, 8]]

let found = findElement(matrix, 5)
print(found!.row, found!.col)



