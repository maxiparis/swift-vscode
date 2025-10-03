func isPalindrome(_ s: String) -> Bool {
    let f = s.filter { $0.isLetter || $0.isNumber }
    
    guard !f.isEmpty else { return true }

    var l = f.startIndex
    var r = f.index(before: f.endIndex)

    while (l < r ) {
        if f[l].lowercased() != f[r].lowercased() { return false }
        l = f.index(after: l)
        r = f.index(before: r)
    }
    return true
}


print(isPalindrome("A man, a plan, a canal: Panama"))