/*
   Operations
    Write methods to implement the multiply, substract, and divide operations for integers. The results of all of these things are integers. Use only the add operator.
*/

func negate(_ a: Int) -> Int {
    var neg = 0
    var val = a
    let newSign = a < 0 ? 1 : -1
    while val != 0 {
        neg += newSign
        val += newSign
    }
    return neg
}

func substract(_ a: Int, _ b: Int) -> Int {
    return a + negate(b)
}

func multiply(_ a: Int, _ b: Int) -> Int {
    if a < b {
        return multiply(b, a);
    }
    
    var sum = 0
    var x = abs(b)
    while x > 0 {
        sum += a
        x = substract(x, 1)
    }
    if b < 0 {
        return negate(sum)
    }
    return sum
}

func divide(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return -31337
    }
    let absA = abs(a)
    let absB = abs(b)
    
    var product = 0
    var x = 0
    
    while (product + absB <= absA) {
        product += absB
        x += 1
    }
    
    if a < 0 && b < 0 || a > 0 && b > 0 {
        return x
    }
    return negate(x)
}
