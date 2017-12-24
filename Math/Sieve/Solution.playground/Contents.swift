/*
   Count Primes
     Count the number of prime numbers less than a non-negative number, n.
*/

import Foundation

func countPrimes(_ n: Int) -> Int {
    
    if n <= 2 {
        return 0
    }
    
    let arr = primeHelper(n)
    var counter = 0
    for i in 2..<n {
        if arr[i] {
            counter += 1
        }
    }
    return counter
}

func primeHelper(_ n: Int) -> [Bool] {
    var arr = Array<Bool>(repeating: true, count: n)
    for i in 2..<Int(sqrt(Double(n))) {
        if arr[i] == true {
            for j in stride(from: i * 2, to: n, by: i) {
                arr[j] = false
            }
        }
    }
    return arr
}

countPrimes(10)
