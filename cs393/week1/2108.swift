func firstPalindrome(_ words: [String]) -> String {
    for word in words {
        if isPalindrome(word) { return word }
    }

    return ""
}

func isPalindrome(_ word: String) -> Bool {
    var l = word.startIndex
    var r = word.index(before: word.endIndex)

    while (l < r) {
        if (word[l] != word[r]) { return false }
        l = word.index(after: l)
        r = word.index(before: r)
    }
    return true
}

let words = ["abc","car","ada","racecar","cool"]
print(firstPalindrome(words))



// Things learned