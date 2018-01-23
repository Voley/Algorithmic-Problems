func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    var begin = 0
    var end = letters.count - 1
    while begin < end {
        let mid = (begin + end) / 2;
        if letters[mid] > target {
            end = mid
        } else {
            begin = mid + 1
        }
    }
    return letters[begin] > target ? letters[begin] : letters[0]
}
