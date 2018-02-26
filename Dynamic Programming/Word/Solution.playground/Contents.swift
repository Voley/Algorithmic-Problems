func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let words = Set<String>(wordDict)
    var memo = Array<Bool>(repeating: false, count: s.count + 1)
    memo[0] = true
    for i in 1...s.count {
        for j in 0..<i {
            if (memo[j] && words.contains(s.subString(j,i-j))) {
                memo[i] = true
                break;
            }
        }
    }
    return memo[s.count]
}

extension String {
    func subString (_ start: Int, _ end: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        let subString = self[startIndex..<endIndex]
        return String(subString)
    }
}
