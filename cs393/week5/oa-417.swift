class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        enum Ocean { 
            case atlantic, pacific
        }

        var ROWS = heights.count
        var ROWS_RANGE = 0..<ROWS
        var COLS = heights[0].count
        var COLS_RANGE = 0..<COLS

        var res: [[Int]] = []
        var visitedPacific = Array(repeating: Array(repeating: false, count: COLS), count: ROWS)
        var visitedAtlantic = Array(repeating: Array(repeating: false, count: COLS), count: ROWS)

        var pacific = Array(repeating: Array(repeating: false, count: COLS), count: ROWS)//gets to the pacific 
        var atlantic = Array(repeating: Array(repeating: false, count: COLS), count: ROWS)//gets to the atlantic

        func valid(_ row: Int, _ col: Int, prevHeight: Int, visitedArray: inout [[Bool]]) -> Bool {
            return ROWS_RANGE ~= row && COLS_RANGE ~= col && !visitedArray[row][col] && heights[row][col] >= prevHeight
        }


        //traverses and marks all the neighbors that can reach to that 
        func mark(_ row: Int, _ col: Int, ocean: Ocean) {
            // if is in the first row or col (paciifc) or last row or col (atlantic), mark
            var visitedArray: [[Bool]] = []
            if ocean == .pacific {
                pacific[row][col] = true
                visitedPacific[row][col] = true
                visitedArray = visitedPacific
            } else { //atlantic
                atlantic[row][col] = true
                visitedAtlantic[row][col] = true
                visitedArray = visitedAtlantic
            }
 
            var neighbors = [(row+1, col),(row-1, col),(row, col+1),(row, col-1)]

            for (nrow, ncol) in neighbors where valid(nrow, ncol, prevHeight: heights[row][col], visitedArray: &visitedArray) {
                mark(nrow, ncol, ocean: ocean)
            }
        }

        // checking the first and last column
        for i in ROWS_RANGE {
            mark(i, 0, ocean: .pacific)
            mark(i, COLS-1, ocean: .atlantic)
        }

        // check first and last row
        for i in COLS_RANGE {
            mark(0, i, ocean: .pacific)
            mark(ROWS-1, i, ocean: .atlantic)
        }


        for row in ROWS_RANGE {
            for col in COLS_RANGE {
                if pacific[row][col] && atlantic[row][col] {
                    res.append([row, col])
                }
            }
        }

        return res
    }
}


var a = [[1,1],[1,1],[1,1]]
print(Solution().pacificAtlantic(a))