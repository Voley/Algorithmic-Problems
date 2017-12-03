/*
  Sum of Two Integers
    Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.
 */

func getSum(_ a: Int, _ b: Int) -> Int {
    if a == 0 {
        return b
    }
    if b == 0 {
        return a
    }
    
    let carry = (a & b) << 1
    let answer = a ^ b
    return getSum(carry, answer)
}

print(getSum(20, 30))
