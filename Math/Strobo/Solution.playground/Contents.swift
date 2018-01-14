func isStrobogrammatic(_ num: String) -> Bool {
    return num == rotate(num)
}

func rotate(_ num: String) -> String {
    var result = ""
    for ch in num.reversed() {
        if ch == "6" {
            result.append("9")
        } else if ch == "9" {
            result.append("6")
        } else if ch == "0" || ch == "1" || ch == "8" {
            result.append(ch)
        }
    }
    return result
}

print("Is 6969 Strobogrammatic? \(isStrobogrammatic("6969"))")
