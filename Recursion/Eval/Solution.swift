/*
 Boolean Evaluation
 Given a boolean expression consisting of the symbols 0(false), 1(true), & (AND), | (OR) and ^ (XOR), and a desired boolean result value result, implement a function to count the number of wayts of parenthesizing the expression such that it evaluates to result. The expression shold be fully parenthesized(e.g. (0)^(1)) but not extraneously.
 */

func countEval(_ s: String, _ result: Bool, _ memo: inout Dictionary<String, Int>) -> Int {
    if s.count == 0 {
        return 0
    }
    if s.count == 1 {
        return stringToBool(s) == result ? 1 : 0
    }
    
    if let val = memo["\(result)" + s] {
        return val
    }
    
    var ways = 0
    
    let arr = Array(s)
    
    for i in stride(from: 1, to: s.count, by: 2) {
        let c = arr[i]
        let left = String(s.suffix(i))
        let idx = s.index(s.startIndex, offsetBy: i + 1)
        let right = String(s.suffix(from: idx))
        let leftTrue = countEval(left, true, &memo)
        let leftFalse = countEval(left, false, &memo)
        let rightTrue = countEval(right, true, &memo)
        let rightFalse = countEval(right, false, &memo)
        let total = (leftTrue + leftFalse) * (rightTrue + rightFalse)
        
        var totalTrue = 0
        
        if c == "^" {
            totalTrue = leftTrue * rightFalse + leftFalse * rightTrue
        } else if c == "&" {
            totalTrue = leftTrue * rightTrue
        } else if c == "|" {
            totalTrue = leftTrue * rightTrue + leftFalse * rightTrue + leftTrue * rightFalse
        }
        let subways = result ? totalTrue : total - totalTrue
        ways += subways
    }
    
    memo["\(result)" + s] = ways
    return ways
}

func stringToBool(_ s: String) -> Bool {
    return s == "1"
}

var dict = Dictionary<String, Int>()

print(countEval("1^0|0|1", false, &dict))

