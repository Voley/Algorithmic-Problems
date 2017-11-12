/*
 Debugger
    Explain what the following code does: `((n & ( n - 1)) == 0`
 */

func isPowerOfTwo(_ number: Int) -> Bool {
    
    print("Binary of \(number): \(String.init(number, radix: 2, uppercase: false))")
    print("Binary of \(number)-1: \(String.init(number - 1, radix: 2, uppercase: false))")
    
    return (( number & (number - 1)) == 0)
}

_ = isPowerOfTwo(32)
_ = isPowerOfTwo(256)
