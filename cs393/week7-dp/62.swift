class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp:[[Int?]] = Array(repeating: Array(repeating: nil, count: n), count: m)

        //fill out the first row and col
        for i in 0..<m {
            dp[i][0] = 1
        }

        for i in 0..<n {
            dp[0][i] = 1
        }

        func fillArray(m: Int, n: Int, array: inout [[Int?]]) -> Int {
            if let value = array[m][n] {
                return value
            }
            var newValue = fillArray(m: m-1, n: n, array: &array) + fillArray(m: m, n: n-1, array: &array)
            array[m][n] = newValue

            return newValue
        }

        fillArray(m: m-1, n: n-1, array: &dp)

        return dp[m-1][n-1]!
    }
}


print(Solution().uniquePaths(3, 2))