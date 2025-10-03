//https://leetcode.com/problems/pascals-triangle/description/
func generate(_ numRows: Int) -> [[Int]] {
    var result = [[Int]]()
    for i in 0..<numRows {
        if i == 0 {
            result.append([1])
            continue
        }
        result.append(Array(repeating: 0, count: i+1))

        for v in 0...i {
            if v == 0 || v == i {
                result[i][v] = 1
            } else {
                result[i][v] = result[i-1][v-1] + result[i-1][v]
            }
        }
    }

    return result
}

let fiveRows = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
print(generate(5) == fiveRows ? "✅" : "❌")

