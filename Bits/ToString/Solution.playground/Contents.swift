/*
 Binary to String.
    Given a real number between 0 and 1 (e.g., 0.72) that is passed in as a double, print the binary representation. If the number cannot be represented accurately in binary with at most 32 characters, print "ERROR".
 */

func printBinary(_ number: Double) -> String? {
    
    if number > 1 || number < 0 {
        return nil
    }
    var copy = number
    var result = "."
    while copy > 0 {
        if result.count > 32 {
            return nil
        }
        
        let r = number * 2
        if r >= 1 {
            result.append("1")
            copy = r - 1
        } else {
            result.append("0")
            copy = r
        }
    }
    return result
}

printBinary(0.101)
