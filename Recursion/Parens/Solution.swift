/*
 Parens
     Implement an algorithm to print all valid (e.g., properly opened and closed) combinations of n pairs of parentheses.
     EXAMPLE
     Input: 3
     Output: ((())), (()()), (())(), ()(()), ()()()
 */

func addParen(_ open: Int, _ closed : Int, _ output: String, _ result: inout Array<String>) {
    
    if open == 0 && closed == 0 {
        result.append(output)
        return
    }
    
    if open > 0 {
        addParen(open - 1, closed, output + "(", &result)
    }
    
    if open < closed {
        addParen(open, closed - 1, output + ")", &result)
    }
}

func generateParens(_ count: Int) -> Array<String> {
    var result = Array<String>()
    addParen(count, count, "", &result)
    return result
}

print(generateParens(2))

