func countAndSay(_ n: Int) -> String {
    if n == 1 {
        return "1"
    }
    
    var result = "1"
    for _ in 1..<n { // term number n
        var temp = ""
        var lastDigit = Array(result)[0]
        var count = 1
        for ch in String(result.suffix(result.count - 1)) {
            if ch != lastDigit {
                temp += String(count)
                temp += (String(lastDigit))
                count = 1
                lastDigit = ch
            } else {
                count += 1
            }
        }
        temp += String(count)
        temp += String(lastDigit)
        result = temp
    }
    return result
}

print(countAndSay(4))
