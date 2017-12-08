/*
    Sparse Search
      Given a sorted array of strings that is interpersed with empty strings, write a method to find the location of a given string.
*/

func search(_ str: String, _ array: [String]) -> Int {
    var low = 0
    var high = array.count - 1
    
    while high >= low {
        var mid = high - (high - low) / 2
        var temp = array[mid]
        if temp == "" {
            let initialMid = mid
            while temp == "" && mid < high {
                mid += 1
                temp = array[mid]
            }
            if temp == "" {
                mid = initialMid
                while temp == "" && mid > low {
                    mid -= 1
                    temp = array[mid]
                }
            }
            if temp == "" {
                return -1
            }
        }
        if temp == str {
            return mid
        } else if temp < str {
            low = mid + 1
        } else if temp > str {
            high = mid - 1
        }
    }
    return -1
}

let arr = ["abc", "", "", "baby", "", "", "", "", "", "", "lotto", "smooth"]
print(search("smooth", arr))

