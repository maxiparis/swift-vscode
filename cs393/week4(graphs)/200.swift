class Solution {

    func numIslands(_ grid: [[Character]]) -> Int {
        func discover(_ row: Int, _ col: Int) {
            if ((0 ..< grid.count) ~= row) 
                && ((0 ..< grid[0].count) ~= col) 
                && (grid[row][col] == "1") 
                && (!seen[row][col]) 
            {
                seen[row][col] = true
                discover(row+1, col)
                discover(row-1, col)
                discover(row, col+1)
                discover(row, col-1)
            }
        }

        var islands = 0
        var seen = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                //check if position is (1 and not seen)
                if (grid[row][col] == "1") && (!seen[row][col]) {
                    discover(row, col)
                    islands += 1
                }
            }
        }

        return islands
    }
}