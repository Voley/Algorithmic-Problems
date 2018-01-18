func validPalindrome(_ s: String) -> Bool {
    var begin = 0
    var end = s.count - 1
    
    var array = Array(s)
    while begin < end {
        if array[begin] != array[end] {
            return isPalindrome(array, begin + 1, end) || isPalindrome(array, begin, end - 1);
        }
        begin += 1
        end -= 1
    }
    return true
}

func isPalindrome(_ arr: [Character], _ begin: Int, _ end: Int) -> Bool {
    var b = begin
    var e = end
    
    while b < e {
        if arr[b] != arr[e] {
            return false
        }
        b += 1
        e -= 1
    }
    return true
}
