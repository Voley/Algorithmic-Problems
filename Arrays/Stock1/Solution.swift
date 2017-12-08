/*
   Best Time to Buy and Sell Stock
     Say you have an array for which the ith element is the price of a given stock on day i.
     If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 */

func maxProfit(_ prices: [Int]) -> Int {
    var minimum = Int.max
    var profit = 0
    for item in prices {
        if item < minimum {
            minimum = item
        } else {
            profit = max(profit, item - minimum)
        }
    }
    return profit
}

let prices = [7, 1, 5, 3, 6, 4]
print(maxProfit(prices))
