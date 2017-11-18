
/*
 Valid Parentheses
     Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
     The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.Describe how you could use a single array to implement three stacks.
 */

func isValid(_ s: String) -> Bool {
    let stack = Stack()
    for c in s {
        if c == "[" || c == "{" || c == "("{
            stack.push(c)
        } else if c == "]" || c == "}" || c == ")" {
            guard let res = stack.pop() else { return false }
            
            switch c {
            case "]":
                if res != "[" {
                    return false
                }
                break
            case "}":
                if res != "{" {
                    return false
                }
                break
            case ")":
                if res != "(" {
                    return false
                }
                break
            default:
                break
            }
        }
    }
    return stack.count() > 0 ? false : true
}

class Stack {
    private var data: Array<Character> = []
    
    func count() -> Int {
        return data.count
    }
    
    func push(_ c: Character) {
        data.append(c)
    }
    
    func pop() -> Character? {
        return data.popLast()
    }
}
