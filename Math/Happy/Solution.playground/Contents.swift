/*
    Happy Number
     Write an algorithm to determine if a number is "happy".
     A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
*/

func isHappy(_ n: Int) -> Bool {
    
    var slow = n
    var fast = n
    
    repeat {
        slow = squaredSum(slow)
        fast = squaredSum(fast)
        fast = squaredSum(fast)
        
        if slow == 1 || fast == 1 {
            return true
        }
    } while slow != fast
    
    return false
}

func squaredSum(_ n: Int) -> Int {
    var number = n
    var result = 0
    while number > 0 {
        let temp = number % 10
        number = number / 10
        result += (temp * temp)
    }
    return result
}
