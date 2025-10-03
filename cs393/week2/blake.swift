func isPalindrome(_ x: Int) -> Bool {
    var s = String(x)
    var left = s.startIndex
    var right = s.index(before: s.endIndex)

    while (left < right ){
        if s[left] != s[right] { return false }

        left = s.index(after: left)
        right = s.index(before: right)
    }

    return true
}


print(isPalindrome(121))