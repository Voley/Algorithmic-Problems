func read4(_ buf: inout String) -> Int {
    buf = "Yoth"
    return 4
}

func read(_ buf: inout String, _ upTo: Int) -> Int {
    var total = 0
    var temp = ""
    
    while read4(&temp) > 0 && total < upTo {
        for ch in temp {
            buf.append(ch)
            total += 1
            if total == upTo {
                break
            }
        }
    }
    return total
}

var temp = ""
let count = read(&temp, 3)
print(temp, count)
