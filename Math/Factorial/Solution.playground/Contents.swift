/*
    Factorial Zeros
        Write an algorithm which computes the number of trailing zeroes in n factorial
 */

func factorialZeros(_ n: Int) -> Int {
    var zeroes = 0
    for i in 1...n {
        if i % 5 == 0 {
            zeroes += powerOf5In(i)
        }
    }
    
    return zeroes
}

func powerOf5In(_ num: Int) -> Int {
    var temp = num
    var counter = 0
    
    while temp % 5 == 0 {
        counter += 1
        temp /= 5
    }
    return counter
}

print(factorialZeros(14))
