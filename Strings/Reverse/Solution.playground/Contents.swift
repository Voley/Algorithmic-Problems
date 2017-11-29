/*
  Reverse String
     Write a function that takes a string as input and returns the string reversed.
     Example:
     Given s = "hello", return "olleh".
*/


func reverseString(_ s: String) -> String {
    var str = Array(s)
    var result = ""
    for i in 0..<str.count {
        result.append(str[str.count - 1 - i])
    }
    return result
}

print("String: \"hello\", reversed: \(reverseString("hello"))")
