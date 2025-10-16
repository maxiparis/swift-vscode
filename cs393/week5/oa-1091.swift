class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        var grid = grid
        var LENGTH = grid.count
        var LENGTHRANGE = 0..<LENGTH

        if grid[0][0] == 1 || grid[LENGTH-1][LENGTH-1] == 1 { return -1 }

        // mark all 1s as -1
        for row in LENGTHRANGE {
            for col in LENGTHRANGE {
                if grid[row][col] == 1 { grid[row][col] = -1 }
            }
        }

        func isValid(_ row: Int, _ col: Int, prevCount: Int) -> Bool {
            return (LENGTHRANGE ~= row 
            && LENGTHRANGE ~= col 
            && grid[row][col] != 1 
            && (grid[row][col] > prevCount  || grid[row][col] == 0))
        }

        var queueIndex = 0
        var queue: [[Int]] = [] //0 = row, 1 = col, 2 = count

        queue.append([0, 0, 1]) // append the first col

        while queueIndex < queue.count {
            var first = queue[queueIndex]
            queueIndex += 1
            var row = first[0]
            var col = first[1]
            var count = first[2]

            // print("removed from queue : \(row),\(col), with count = \(count)))")

            if grid[row][col] <= count && grid[row][col] != 0 {
                continue
            }

            // action
            grid[row][col] = count


            //traverse throuhg valid neighbors
            var neighbors = [
                (row+1, col), (row-1, col), 
                (row, col+1), (row, col-1), 
                (row+1, col+1), (row-1, col-1), 
                (row-1, col+1), (row+1, col-1)
            ]

            for (nr, nc) in neighbors {
                // print("checking neighbor in \(nr), \(nc)")
                if isValid(nr, nc, prevCount: count) {
                    // print("added to queue \(nr), \(nc)")
                    queue.append([nr, nc, count+1])
                }
            }
            

        }

        return grid[LENGTH-1][LENGTH-1] == 0 ? -1 : grid[LENGTH-1][LENGTH-1]
    }
}

var a = [[0,1],[1,0]]
print(Solution().shortestPathBinaryMatrix(a))