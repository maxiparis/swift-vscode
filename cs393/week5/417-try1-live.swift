class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var cache = Array(repeating: Array(repeating: "", count: heights[0].count), count: heights.count) //P/A 
        var res: [[Int]] = []

        for row in 0..<heights.count {
            for col in 0..<heights[0].count {
                print("CHECKING (\(row),\(col)) = \(heights[row][col])")

                var up = row - 1
                var down = row + 1
                var left = col - 1
                var right = col + 1
                
                var canGoPacific = false
                var canGoAtlantic = false

                if ( row == 0 || col == 0 ) {
                    canGoPacific = true
                } else if (left >= 0 && heights[row][left] <= heights[row][col] && pacific(row, left)) { 
                    canGoPacific = true
                } else if up >= 0 && heights[up][col] <= heights[row][col] && pacific(up, col) {
                    canGoPacific = true
                }

                if ( row == heights.count-1 || col == heights[0].count-1 ) {
                    canGoAtlantic = true
                } else if right < heights[0].count && heights[row][right] <= heights[row][col] && atlantic(row, right) { 
                    canGoAtlantic = true
                } else if down < heights[0].count && heights[down][col] <= heights[row][col] && atlantic(down, col) {
                    canGoAtlantic = true
                }

                if (canGoPacific && canGoAtlantic) {
                    print("(\(row),\(col)) can go to both sides")
                    res.append([row, col])
                }
            }
        }

        func pacific(_ row: Int, _ col: Int) -> Bool {
            guard 0..<heights.count ~= row && 0..<heights[0].count ~= col else {
                return false 
            }
            print("(\(row),\(col)) checking if can go to pacific")

            if cache[row][col] == "P" {
                return true
            } else {
                if row == 0 || col == 0 {
                    cache[row][col] = "P"
                    return true
                }
                if heights[row-1][col] <= heights[row][col] && pacific(row-1, col) {
                    cache[row][col] = "P"
                    return true
                }

                if heights[row][col-1] <= heights[row][col] && pacific(row, col-1) {
                    cache[row][col] = "P"
                    return true
                }
            }
            print("(\(row),\(col)) can't go to pacific")
            return false
        }

        func atlantic(_ row: Int, _ col: Int) -> Bool {
            guard 0..<heights.count ~= row && 0..<heights[0].count ~= col else { return false }
            print("(\(row),\(col)) checking if can go to atlantic")



            if cache[row][col] == "A" {
                return true
            } else {
                if row == heights.count-1 || col == heights[0].count-1 {
                    cache[row][col] = "A"
                    return true
                }

                if heights[row+1][col] <= heights[row][col] && atlantic(row+1, col) {
                    cache[row][col] = "A"
                    return true
                }

                if heights[row][col+1] <= heights[row][col] && atlantic(row, col+1) {
                    cache[row][col] = "A"
                    return true
                }
            }
            print("(\(row),\(col)) can't go to atlantic")
            return false
        }
        return res
    }
}


var heights = [[1,2,3],[8,9,4],[7,6,5]]
print(Solution().pacificAtlantic(heights))