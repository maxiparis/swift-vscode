class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard !word1.isEmpty else { return word2.count }
        guard !word2.isEmpty else { return word1.count }

        var ROWS = word1.count + 1
        var COLS = word2.count + 1

        var w1 = Array(word1)
        var w2 = Array(word2)

        var a = Array(repeating: Array(repeating: -1, count: COLS), count: ROWS)

        //BASE CASE
        for i in 0..<ROWS {
            a[i][0] = i
        }

        for i in 0..<COLS {
            a[0][i] = i
        }


        // ----
        for row in 1..<ROWS {
            for col in 1..<COLS {
                if w1[row-1] == w2[col-1] {
                    print("a")
                    a[row][col] = a[row-1][col-1]
                } else {
                    print("b")
                    a[row][col] = min(a[row][col-1],a[row-1][col],a[row-1][col-1]) + 1
                }
            }
        }


        // a.forEach { print($0) }
        return a.last!.last!
    }
}


print(Solution().minDistance("a", "aa"))