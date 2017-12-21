/*
    Integer to English Words
       Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.
       For example,
       123 -> "One Hundred Twenty Three"
       12345 -> "Twelve Thousand Three Hundred Forty Five"
       1234567 -> "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
*/

let singles = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty"]
let tenths = ["Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]

func numberToWords(_ num: Int) -> String {
    if num == 0 {
        return "Zero"
    }
    var result = recHelper(num)
    result.remove(at: result.startIndex)
    return result
}

func recHelper(_ num: Int) -> String {
    if num >= 1000000000 {
        return recHelper(num / 1000000000) + " Billion" + recHelper(num % 1000000000)
    } else if num >= 1000000 {
        return recHelper(num / 1000000) + " Million" + recHelper(num % 1000000)
    } else if num >= 1000 {
        return recHelper(num / 1000) + " Thousand" + recHelper(num % 1000)
    } else if num >= 100 {
        return recHelper(num / 100) + " Hundred" + recHelper(num % 100)
    } else if num >= 20 {
        return " " + tenths[num / 10] + recHelper(num % 10)
    } else if num >= 1 {
        return " " + singles[num]
    } else {
        return ""
    }
}

print(numberToWords(1997))
