
/*
     Write a method to replace all spaces in a string with “%20”.
     You may assume that the string has sufficient space at the end to hold additional characters,
     and that you are given the “true” length of the string.
     (Note: if implementing in Java, please use a character array so that you can
     perform this operation in place.)
 */

extension String {
    func urlify() -> String {
        var result = ""
        for char in self {
            if char == " " {
                result += "%20"
            } else {
                result.append(char)
            }
        }
        return result
    }
}

print("Hello, world! Some words".urlify())


