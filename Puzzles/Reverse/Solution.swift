/*
 Reverse Integer
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example:
 Input: `123`
 Output:  `321`
*/

func reverse(_ x: Int) -> Int {
    if x > Int32.max || x < Int32.min {
        return 0
    }
    
    let negative = x < 0
    var temp = max(x, -x)
    var result = 0
    while temp > 0 {
        let z = temp % 10
        result *= 10
        result += z
        temp /= 10
    }
    
    if negative {
        result = -result
    }
    
    if result > Int32.max || result < Int32.min {
        return 0
    }
    
    return result
}

print(reverse(123))
