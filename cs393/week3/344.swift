func reverseString(_ s: inout [Character]) {
    var l = s.startIndex
    var r = s.index(before: s.endIndex)

    while (l < r) {
        (s[l], s[r]) = (s[r], s[l])
        // s.swapAt(l, r)
        l = s.index(after: l)
        r = s.index(before: r)
    }
}

