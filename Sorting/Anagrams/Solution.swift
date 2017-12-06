/*
    Group Anagrams
      Write a method to sort an array of strings so that all the anagrams are next to each other.
*/

func sort(_ string: String) -> String {
    let temp = Array(string).sorted()
    return String(temp)
}

func groupAnagrams(_ array: [String]) -> [String] {
    var dict = Dictionary<String, [String]>()
    for str in array {
        let temp = sort(str)
        if var arr = dict[temp] {
            arr.append(str)
            dict[temp] = arr
        } else {
            dict[temp] = [str]
        }
    }
    var result = [String]()
    for (_, value) in dict {
        result.append(contentsOf: value)
    }
    
    return result
}

let temp = ["ginger", "reggin", "joe", "eoj", "mac", "cam"]
print(groupAnagrams(temp))
