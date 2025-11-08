// class Solution {
//     func countVowels(_ word: String) -> Int {
//         var vowels: Set<Character> = ["a", "e", "i", "o", "u"]
//         guard word.contains(where: { vowels.contains($0) }) else { return 0 }
//         var wordArray:[Character] = Array(word)
//         var matrix = Array(repeating: Array(repeating: 0, count: word.count), count: word.count)

//         var sum = 0
//         var innerSum = 0
//         //Base case
//         for col in 0..<matrix.count {
//             innerSum += (vowels.contains(wordArray[col]) ? 1 : 0)
//             sum += innerSum
//             matrix[0][col] = innerSum
//         }

//         //DP
//         for row in 1..<matrix.count {
//             var diagonalValue = matrix[row-1][row-1]
//             for col in row..<matrix[0].count {
//                 var upValue = matrix[row-1][col]
//                 var val = upValue - diagonalValue
//                 sum += val
//                 matrix[row][col] =  val
//             }
//         }

//         return sum
//     }
// }


class Solution {
    func countVowels(_ word: String) -> Int {
        var sum = 0
        var vowels: Set<Character> = ["a", "e", "i", "o", "u"]

        var a = Array<Character>(word)
        var aCount = a.count

        for i in 0..<a.count {
            if vowels.contains(a[i]) {
                //check in how many substrings this vowel appears
                var tilEnd = aCount - i
                var up = i + 1
                sum += tilEnd * up 
            }
        }

        return sum
    }
}


print(Solution().countVowels("aba"))

// learned:
// contains(where: Bool) same as JS.some(Boolean)

