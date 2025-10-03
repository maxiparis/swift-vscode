func countBinarySubstrings(_ s: String) -> Int {
    var left = s.startIndex
    var right = s.startIndex
    var sum = 0

    while right < s.endIndex {
        var currNum = s[right]
        var prevNum = s[right == s.startIndex ? s.startIndex : s.index(before: right)]
        if currNum != prevNum {
            var originalCharOnRight = currNum //helps us to keep track if the right char changed
            left = s.index(before: right)
            var leftNum = s[left]
            while ((leftNum != currNum) && (originalCharOnRight == currNum)) {
                sum += 1
                
                if left != s.startIndex {
                    left = s.index(before: left)
                } else {
                    break
                }

                if right != s.index(before: s.endIndex) {
                    right = s.index(after: right)
                } else {
                    break
                }
            }

        } else {
            right = s.index(after: right) //advance right
        }
    }
    return sum
}


let input = "00110011"
let result = 6
print(countBinarySubstrings(input) == result)