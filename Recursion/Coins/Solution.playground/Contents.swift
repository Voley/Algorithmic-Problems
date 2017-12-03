/*
 Coins
    Given an infinite number of quarters (25 cents), dimes (10 cents), nickels (5 cents), and pennies (1 cent), write code to calculate the number of ways of representing n cents.
 */

func coins(_ value: Int) -> Int {
    var denominations = [1, 5, 10, 25]
    var f = Array<Int>(repeatElement(0, count: value + 1))
    f[0] = 1
    
    for i in 0..<denominations.count {
        for j in 1...value {
            if j >= denominations[i] {
                f[j] = f[j] + f[j - denominations[i]]
            }
        }
    }
    return f[value]
}

print(coins(6))
print(coins(11))
print(coins(100))

