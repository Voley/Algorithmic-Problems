func reverseWords(_ str: inout [Character]) {
    str.reverse()
    var begin = 0
    var end = 0
    
    for i in 0..<str.count {
        let ch = str[i]
        if ch == " " {
            reverseInPlace(&str, begin, end)
            begin = i + 1
        }
        end = i
    }
    
    if begin < end {
        reverseInPlace(&str, begin, end)
    }
}

func reverseInPlace(_ str: inout [Character], _ begin: Int, _ end: Int) {
    var b = begin
    var e = end
    while b < e {
        let temp = str[b]
        str[b] = str[e]
        str[e] = temp
        b += 1
        e -= 1
    }
}
