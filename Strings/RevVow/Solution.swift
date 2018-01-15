func reverseVowels(_ s: String) -> String {
    var arr = Array(s)
    var begin = 0
    var end = arr.count - 1
    
    while begin < end {
        while !isVowel(arr[begin]) && begin < arr.count - 1 {
            begin += 1
        }
        while !isVowel(arr[end]) && end > 0 {
            end -= 1
        }
        
        if begin < end && isVowel(arr[begin]) && isVowel(arr[end]) {
            let temp = arr[begin]
            arr[begin] = arr[end]
            arr[end] = temp
            begin += 1
            end -= 1
        }
    }
    return String(arr)
}

func isVowel(_ ch: Character) -> Bool {
    return ch == "a" || ch == "e" || ch == "i" || ch == "u" || ch == "o" ||
        ch == "A" || ch == "E" || ch == "I" || ch == "U" || ch == "O"
}

print(reverseVowels("leetcode"))
