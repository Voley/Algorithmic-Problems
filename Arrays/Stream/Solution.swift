/*
   Best Time to Buy and Sell Stock
     Say you have an array for which the ith element is the price of a given stock on day i.
     If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
*/

class MovingAverage {
    var storage: [Double] = []
    var sum: Double = 0
    var count = 0
    var capacity = 0
    var startIndex = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func next(_ value: Double) -> Double {
        if count + 1 > capacity {
            sum -= storage[startIndex]
            startIndex += 1
        } else {
            count += 1
        }
        sum += value
        storage.append(value)
        return sum / Double(count)
    }
}

var avg = MovingAverage(3)
for i in 1..<10 {
    print(avg.next(Double(i)))
}
