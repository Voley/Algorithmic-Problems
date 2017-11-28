/*
    Implement double pow(double, int)
*/

func myPow(_ x: Double, _ n: Int) -> Double {
    var result = 1.0
    var m = n
    var y = x
    if m < 0 {
        m *= -1
        y = 1 / y
    }
    while m > 0 {
        if m & 1 > 0 {
            result *= y
        }
        y = y * y
        m >>= 1
    }
    return result
}
        
print(myPow(2, -10))

