class Solution {
    func maximumCostSubstring(_ s: String, _ chars: String, _ vals: [Int]) -> Int {
        var alphabet: [Character:Int] = [
            "a": 1,
            "b": 2,
            "c": 3,
            "d": 4,
            "e": 5,
            "f": 6,
            "g": 7,
            "h": 8,
            "i": 9,
            "j": 10,
            "k": 11,
            "l": 12,
            "m": 13,
            "n": 14,
            "o": 15,
            "p": 16,
            "q": 17,
            "r": 18,
            "s": 19,
            "t": 20,
            "u": 21,
            "v": 22,
            "w": 23,
            "x": 24,
            "y": 25,
            "z": 26,
        ]

        var charsString: [Character] = Array(chars)

        for i in 0..<charsString.count {
            alphabet[charsString[i]] = vals[i]
        }

        var converted: [Int] = []

        for char in s {
            converted.append(alphabet[char]!)
        }
        
        var result = Int.min

        for i in 0..<converted.count {
            var tmp = 0
            for inner in i..<converted.count {
                tmp += converted[inner]
                result = max(result, tmp)
            }
        }


        return max(0, result)
        // return max(0, 0)
    }
}

print(Solution().maximumCostSubstring("adaa", "d" , [-1000]))


