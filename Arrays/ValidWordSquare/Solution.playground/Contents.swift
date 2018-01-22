func validWordSquare(_ words: [String]) -> Bool {
    var arr = [[Character]]()
    for str in words {
        arr.append(Array(str))
    }
    
    for i in 0..<arr.count {
        for j in 0..<arr[i].count {
            if j >= arr.count || i >= arr[j].count || arr[i][j] != arr[j][i] {
                return false
            }
        }
    }
    return true
}
