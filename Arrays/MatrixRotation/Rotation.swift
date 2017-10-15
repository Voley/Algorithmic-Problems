/*
 Rotate Matrix: Given an image represented by a NxN matrix,
 where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees.
 Can you do this in place?
 */


class Matrix {
    var rows: Array<Array<Int>> = []
    var size: Int = 0
    
    // naive, with copying
    
    func rotateClockwise() {
        var resultingArray: Array<Array<Int>> = []
        for _ in stride(from: 0, to: size, by: 1) {
            var temp: Array<Int> = [0, 0, 0]
            resultingArray.append(temp)
        }
        
        for row in stride(from: 0, to: size, by: 1) {
            for column in stride(from: 0, to: size, by: 1) {
                resultingArray[column][row] = rows[size - row - 1][column]
            }
        }
        rows = resultingArray
    }
    
    // in place, no copying
    
    func rotateInPlace() {
        let n = size
        
        for layer in stride(from:0, to:n / 2, by: 1) {
            let first = layer
            let last = n - 1 - layer
            for i in stride(from: first, to: last, by: 1) {
                
                let offset = i - first
                let top = rows[first][i]
                
                // left -> top
                rows[first][i] = rows[last - offset][first];
                
                // bottom -> left
                rows[last - offset][first] = rows[last][last - offset];
                
                // right -> bottom
                rows[last][last - offset] = rows[i][last]
                
                // top -> right
                rows[i][last] = top
            }
        }
    }
}

var matrix1 = Matrix();
matrix1.size = 3
matrix1.rows = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
print("Before matrix rotation: \(matrix1.rows)")
matrix1.rotateInPlace()
print("After matrix rotation: \(matrix1.rows)")
