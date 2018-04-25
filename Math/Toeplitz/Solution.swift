    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let w = matrix[0].count
        let h = matrix.count
        
        for i in 1..<h {
            for j in 1..<w {
                if matrix[i][j] != matrix[i-1][j-1] {
                    return false
                }
            }
        }
        return true
    }
