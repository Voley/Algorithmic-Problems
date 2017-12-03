/*
 Eight Queens
  Write an algorithm to print all ways of arranging eight queens on an 8x8 chess board so that none of them share the same row, column, or diagonal.
 
 */

var gridSize = 8

func placeQueens(_ row: Int, _ columns: inout [Int], _ result: inout [[Int]]) {
    if row == gridSize {
        result.append(columns)
    } else {
        for col in 0..<gridSize {
            if checkValid(columns, row, col) {
                columns[row] = col
                placeQueens(row + 1, &columns, &result)
            }
        }
    }
}

func checkValid(_ columns: [Int], _ row: Int, _ column: Int) -> Bool {
    for row2 in 0..<row {
        let column2 = columns[row2]
        if column == column2 {
            return false
        }
        let columnDistance = abs(column2 - column)
        let rowDistance = row - row2
        if columnDistance == rowDistance {
            return false
        }
    }
    return true
}

var columns = [Int](repeatElement(0, count: gridSize))
var result = [[Int]]()
placeQueens(0, &columns, &result)
print(result.count)

