import Foundation

func count2InRangeAt(_ n: Int, _ digit: Int) -> Int {
    let pow10 = Int(pow(Double(10), Double(digit)))
    let nextPow10 = pow10 * 10
    let right = n % pow10
    
    let roundDown = n - n % nextPow10
    let roundUp = roundDown + nextPow10
    
    let digit = (n / pow10) % 10
    if digit < 2 {
        return roundDown / 10
    } else if digit == 2 {
        return roundDown / 10 + right + 1
    } else {
        return roundUp / 10
    }
}

func count2sInRange(_ upTo: Int) -> Int {
    var count = 0
    let len = String(upTo).count
    for i in 0..<len {
        count += count2InRangeAt(upTo, i)
    }
    return count
}

print(count2sInRange(23))
