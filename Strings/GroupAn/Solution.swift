func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = Dictionary<String, [String]>()
    
    for str in strs {
        let temp = String(str.sorted())
        if var arr = dict[temp] {
            arr.append(str)
            dict[temp] = arr
        } else {
            dict[temp] = [str]
        }
    }
    return Array(dict.values)
}

