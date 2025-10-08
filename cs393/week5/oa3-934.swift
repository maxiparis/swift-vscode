class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        let LENGTH = grid.count
        let LENGTH_RANGE = 0..<LENGTH
        var grid = grid
        var queue: [[Int]] = []

        func markNegativeOnes(_ row: Int, _ col: Int) {
            grid[row][col] = -1
            queue.append([row, col, 0]) // Add distance as third element
            var neighbors: [(Int, Int)] = [(row+1, col), (row-1, col), (row, col+1), (row, col-1)]
            
            for (nr, nc) in neighbors where validate(nr, nc) {
                markNegativeOnes(nr, nc)
            }
        }

        func validate(_ row: Int, _ col: Int) -> Bool {
            return LENGTH_RANGE ~= row && LENGTH_RANGE ~= col && grid[row][col] == 1
        }

        // Find the first island and mark it as -1
        var found = false
        for row in LENGTH_RANGE {
            if found { break } 
            for col in LENGTH_RANGE {
                if found { break } 
                if grid[row][col] == 1 {
                    found = true
                    markNegativeOnes(row, col)
                }
            }
        }
        
        // BFS from all cells of the first island
        var visited = Array(repeating: Array(repeating: false, count: LENGTH), count: LENGTH)
        
        // Mark all starting cells as visited
        for cell in queue {
            visited[cell[0]][cell[1]] = true
        }
        
        var queueIndex = 0
        while queueIndex < queue.count {
            let currRow = queue[queueIndex][0]
            let currCol = queue[queueIndex][1]
            let currDistance = queue[queueIndex][2]
            queueIndex += 1
            
            let neighbors: [(Int, Int)] = [(currRow+1, currCol), (currRow-1, currCol), 
                                           (currRow, currCol+1), (currRow, currCol-1)]
            
            for (nr, nc) in neighbors {
                guard LENGTH_RANGE ~= nr && LENGTH_RANGE ~= nc && !visited[nr][nc] else { continue }
                
                // Found the second island!
                if grid[nr][nc] == 1 {
                    return currDistance
                }
                
                // It's water (0), keep expanding
                visited[nr][nc] = true
                queue.append([nr, nc, currDistance + 1])
            }
        }
        
        return -1
    }
}