/*
  First Bad Version
     You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
     Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
     You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
*/

func isBad(_ value: Int) -> Bool {
    return value > 100
}

func firstBad(_ value: Int) -> Int {
    var low = 0
    var high = value
    
    while high > low {
        let mid = high - (high - low) / 2
        if isBad(mid) {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return high + 1;
}

print(firstBad(1501))
