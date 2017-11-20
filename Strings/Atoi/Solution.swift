/*
 Implement atoi to convert a string to an integer.
     Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.
     Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.
 */

func myAtoi(_ str: String) -> Int {
    if var firstString = str.split(separator: " ").first {
        let array = Array(firstString)
        var result = 0
        var negative = false
        for i in 0..<array.count {
            let c = array[i]
            if i == 0 {
                if c == "-" {
                    negative = true
                    continue
                } else if c == "+" {
                    continue
                }
            }
            let digit = charToDigit(c)
            if digit == -1 {
                return validateResult(result, negative)
            }
            let temp = result.multipliedReportingOverflow(by: 10)
            if temp.overflow {
                if negative {
                    return Int(Int32.min)
                }
                return Int(Int32.max)
            }
            result = temp.0
            
            let temp2 = result.addingReportingOverflow(digit)
            if temp2.overflow {
                if negative {
                    return Int(Int32.min)
                }
                return Int(Int32.max)
            }
            result = temp2.0
        }
        return validateResult(result, negative)
    }
    return 0
}

func validateResult(_ value: Int, _ negative: Bool) -> Int {
    if value > Int32.max {
        if negative {
            return Int(Int32.min)
        }
        return Int(Int32.max)
    }
    return negative ? -value : value
}

func charToDigit(_ c: Character) -> Int {
    switch c {
    case "0":
        return 0
    case "1":
        return 1
    case "2":
        return 2
    case "3":
        return 3
    case "4":
        return 4
    case "5":
        return 5
    case "6":
        return 6
    case "7":
        return 7
    case "8":
        return 8
    case "9":
        return 9
    default:
        return -1
    }
    return -1
}

print("Atoi string -38728 to integer: \(myAtoi("-38728"))")

