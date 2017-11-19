/*
 Self Dividing Numbers
     A self-dividing number is a number that is divisible by every digit it contains.
     For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
     Also, a self-dividing number is not allowed to contain the digit zero.
     Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.
 */

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var result = Array<Int>()
    
    for num in left...right {
        if selfDivisible(num) {
            result.append(num)
        }
    }
    
    return result
}

func selfDivisible(_ value: Int) -> Bool {
    var divisor = value % 10
    var temp = value
    while temp > 0 {
        if divisor == 0 {
            return false
        }
        if value % divisor != 0 {
            return false
        }
        temp = temp / 10
        divisor = temp > 0 ? temp % 10 : 1
    }
    return true
}

print(selfDividingNumbers(1, 22))
