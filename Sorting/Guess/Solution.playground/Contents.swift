/*
 Guess Number Higher or Lower
     We are playing the Guess Game. The game is as follows:
     I pick a number from 1 to n. You have to guess which number I picked.
     Every time you guess wrong, I'll tell you whether the number is higher or lower.
     You call a pre-defined API guess(int num) which returns 3 possible results (-1, 1, or 0).
*/

func guess(_ val: Int) -> Int {
    if val == 36 {
        return 0;
    } else if val < 36 {
        return 1
    }
    return -1
}

func guessNumber(_ n: Int) -> Int {
    var low = 0;
    var high = n;
    
    while high >= low {
        let mid = high - (high - low) / 2
        if guess(mid) == 0 {
            return mid
        } else if guess(mid) == -1 {
            high = mid - 1
        } else if guess(mid) == 1 {
            low = mid + 1
        }
    }
    return -1
}

print(guessNumber(36))
