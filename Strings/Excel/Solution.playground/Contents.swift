/*
  Excel Sheet Column Title
     Given a positive integer, return its corresponding column title as appear in an Excel sheet.
     For example:
     1 -> A
     2 -> B
     3 -> C
     ...
     26 -> Z
     27 -> AA
     28 -> AB
*/

func convertToTitle(_ n: Int) -> String {
    
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var temp = n
    var result = ""
    
    while temp > 0 {
        temp -= 1
        let index = temp % 26
        result = letters[index] + result
        temp /= 26
    }
    return result
}
