/*
 Zero Matrix:
 Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.
 */

class Matrix {
    var rows: Array<Array<Int>> = []
    var rowSize: Int = 0
    var columnSize: Int = 0
    
    func checkMatrixInPlace() {
        
        func nullifyRow(_ row: Int) {
            for i in stride(from: 0, to: rowSize, by: 1) {
                rows[row][i] = 0
            }
        }
        
        func nullifyColumn(_ column: Int) {
            for i in stride(from: 0, to: columnSize, by: 1) {
                rows[i][column] = 0
            }
        }
        
        // check if first row or column should be nullified
        
        var shouldClearFirstRow = false
        var shouldClearFirstColumn = false
        
        for i in stride(from:0, to: rowSize, by: 1) {
            if rows[0][i] == 0 {
                shouldClearFirstRow = true
                break
            }
        }
        
        for i in stride(from:0, to: columnSize, by: 1) {
            if rows[i][0] == 0 {
                shouldClearFirstColumn = true
                break
            }
        }
        
        // mark first items in row, column with zeroes if a row/column needs clearing
        for row in stride(from: 0, to: columnSize, by: 1) {
            for column in stride(from: 0, to: rowSize, by: 1) {
                if rows[row][column] == 0 {
                    rows[0][column] = 0;
                    rows[row][0] = 0;
                }
            }
        }
        
        // nullify rows from the bottom but the first one
        for row in stride(from: columnSize - 1, to: 0, by: -1) {
            if rows[row][0] == 0 {
                nullifyRow(row)
            }
        }
        
        // nullify columns
        for column in stride(from: rowSize - 1, to: 0, by: -1) {
            if rows[0][column] == 0 {
                nullifyColumn(column)
            }
        }
        
        // nullify first row if needed
        if shouldClearFirstRow {
            nullifyRow(0)
        }
        
        // nullify first column if needed
        if shouldClearFirstColumn {
            nullifyColumn(0)
        }
    }
    
    func checkMatrix() {
        var rowsSet = Set<Int>()
        var columnsSet = Set<Int>()
        
        for row in stride(from: 0, to: columnSize, by: 1) {
            for column in stride(from: 0, to: rowSize, by: 1) {
                if rows[row][column] == 0 {
                    rowsSet.insert(row)
                    columnsSet.insert(column)
                }
            }
        }
        
        for row in stride(from: 0, to: columnSize, by: 1) {
            for column in stride(from: 0, to: rowSize, by: 1) {
                if rowsSet.contains(row) || columnsSet.contains(column) {
                    rows[row][column] = 0
                }
            }
        }
    }
}

var matrix1 = Matrix();
matrix1.rowSize = 3
matrix1.columnSize = 3
matrix1.rows = [[1, 2, 3],[4, 0, 6],[7, 8, 9]]

print("Before matrix rotation: \(matrix1.rows)")
matrix1.checkMatrix()
print("After matrix rotation: \(matrix1.rows)")

