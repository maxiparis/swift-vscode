class Solution {
    enum Ocean { 
        case pacific, atlantic
    }

    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var ROWS = heights.count
        var COLS = heights[0].count

        var results: [[Int]] = []
        var canReachPacific = Array(repeating: Array(repeating: false, count: COLS), count: ROWS)
        var canReachAtlantic = Array(repeating: Array(repeating: false, count: COLS), count: ROWS)

        func traverseOcean(_ row: Int, _ col: Int, ocean: Ocean, canReachArray: inout [[Bool]]) {
            var currHeight = heights[row][col]
            canReachArray[row][col] = true
            
            //left, right, up, down
            let neighbors = [(row-1, col),(row+1, col),(row, col-1),(row, col+1)]

            func isValid(_ row: Int, _ col: Int) -> Bool {
                return 0..<ROWS ~= row && 0..<COLS ~= col && !canReachArray[row][col] && heights[row][col] >= currHeight
            }

            for (nr, nc) in neighbors where isValid(nr, nc){
                traverseOcean(nr, nc, ocean: ocean, canReachArray: &canReachArray)
            }
        }

        //find and mark all that can reach pacific
        for row in 0..<ROWS { //first col
            traverseOcean(row, 0, ocean: .pacific, canReachArray: &canReachPacific)
        }

        for col in 0..<COLS { //first row
            traverseOcean(0, col, ocean: .pacific, canReachArray: &canReachPacific)
        }

        //find and mark all that can reach atlantic
        for row in 0..<ROWS { //first col
            traverseOcean(row, COLS-1, ocean: .atlantic, canReachArray: &canReachAtlantic)
        }

        for col in 0..<COLS { //first row
            traverseOcean(ROWS-1, col, ocean: .atlantic, canReachArray: &canReachAtlantic)
        }


        for row in 0..<ROWS {
            for col in 0..<COLS {
                if canReachPacific[row][col] && canReachAtlantic[row][col] {
                    results.append([row, col])
                }
            }
        }

        return results
    }
}

var a = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
Solution().pacificAtlantic(a)
