class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var res = Array(repeating: false, count: s.count+1)
        res[0] = true
        var unique = Set(wordDict)

        var sstring: [Character] = Array(s)

        outer: for i in 1..<res.count {
            for j in 0..<i {
                if res[j] && unique.contains(String(sstring[j..<i])){ 
                    res[i] = true
                    continue outer
                }
            }
        }

        return res[s.count]
    }
}

print(Solution().wordBreak("a", ["a"]))

