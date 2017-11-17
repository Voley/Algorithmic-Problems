/*
 Roman to Integer
     Given a roman numeral, convert it to an integer.
     Input is guaranteed to be within the range from 1 to 3999.
 */

import Foundation

func romanToInt(_ s: String) -> Int {
    var previous = 0
    var result = 0
    for c in s {
        var value = 0
        switch c {
        case "I":
            value = 1
            break
        case "V":
            value = 5
            break
        case "X":
            value = 10
            break
        case "L":
            value = 50
            break
        case "C":
            value = 100
            break
        case "D":
            value = 500
            break
        case "M":
            value = 1000
            break
        default:
            break
        }
        if previous < value {
            result -= previous
        } else {
            result += previous
        }
        previous = value
    }
    result += previous
    return result
}

