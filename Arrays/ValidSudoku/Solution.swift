func isValidSudoku(_ board: [[Character]]) -> Bool {
    var set = Set<Character>()
    
    // check horizontals
    for i in 0..<9 {
        for j in 0..<9 {
            if board[i][j] == "." {
                continue
            }
            if set.contains(board[i][j]) {
                return false
            }
            set.insert(board[i][j])
        }
        set.removeAll()
    }
    
    // verticals
    for i in 0..<9 {
        for j in 0..<9 {
            if board[j][i] == "." {
                continue
            }
            if set.contains(board[j][i]) {
                return false
            }
            set.insert(board[j][i])
        }
        set.removeAll()
    }
    
    // squares
    for i in 0..<3 {
        for j in 0..<3 {
            for subRow in 0..<3 {
                for subCol in 0..<3 {
                    let val = board[i * 3 + subRow][j * 3 + subCol]
                    if val == "." {
                        continue
                    }
                    if set.contains(val) {
                        return false
                    }
                    set.insert(val)
                }
            }
            set.removeAll()
        }
    }
    return true
}
