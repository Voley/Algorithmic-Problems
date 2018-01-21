class Solution {
    func removeComments(_ source: [String]) -> [String] {
        
    }
    return []
}

let input = ["/*Test program */", "int main()", "{ ", "  // variable declaration ", "int a, b, c;", "/* This is a test", "   multiline  ", "   comment for ", "   testing */", "a = b + c;", "}"]
//let input = ["a/*/b//*c","blank","d/*/e*//f"]
let sol = Solution()
let result = sol.removeComments(input)
print(result)

