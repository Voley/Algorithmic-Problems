func countSubstrings(_ s: String) -> Int {
    let arr = Array(s)
    var result = s.count
    for i in stride(from: 0.5, to: Double(arr.count), by: 0.5) {
        var left = Int(i - 0.5)
        var right = Int(i + 1)
        while left >= 0 && right < arr.count && arr[left] == arr[right] {
            result += 1
            left -= 1
            right += 1
        }
    }
    return result
}

print(countSubstrings("abba"))
