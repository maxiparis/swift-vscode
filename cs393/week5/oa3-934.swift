class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        let LENGTH = grid.count
        let LENGTH_RANGE = 0..<LENGTH
        var grid = grid


        func markTwos(_ row: Int, _ col: Int) {
            grid[row][col] = 2
            var neighbors: [(Int, Int)] = [(row+1, col), (row-1, col), (row, col+1), (row, col-1)]
            
            for (nr, nc) in neighbors where validate(nr, nc) {
                markTwos(nr, nc)
            }
        }

        func validate(_ row: Int, _ col: Int) -> Bool {
            return LENGTH_RANGE ~= row && LENGTH_RANGE ~= col && grid[row][col] == 1
        }

        // find the first 1, named twos
        var found = false
        for row in LENGTH_RANGE {
            if found { break } 
            for col in LENGTH_RANGE {
                if found { break } 
                if grid[row][col] == 1 {
                    // we connect them
                    found = true
                    markTwos(row, col)
                }
            }
        }
        //----------------------
        var visitedOnes = Array(repeating: Array(repeating: false, count: LENGTH), count: LENGTH)
        var minDistance = Int.max
        var queue: [[Int]] = []

        func markDistances(_ row: Int, _ col: Int, _ distance: Int) {
            visitedOnes[row][col] = true
            if grid[row][col] == 2 {
                minDistance = min(minDistance, distance-1)
            }
        }   

        func validate2(_ row: Int, _ col: Int) -> Bool {
            return LENGTH_RANGE ~= row && LENGTH_RANGE ~= col && (grid[row][col] == 0 || grid[row][col] == 2) && !visitedOnes[row][col]
        } 

        //find the remaining ones, and find the distance
        for row in LENGTH_RANGE {
            for col in LENGTH_RANGE {
                if grid[row][col] == 1 {
                    queue.append([row, col, 0]) //row, col, distance
                    while !queue.isEmpty {
                        var position = queue.removeFirst()
                        var currRow = position[0]
                        var currCol = position[1]
                        var currDistance = position[2]
                        visitedOnes[currRow][currCol] = true

                        print("in bfs \(position[0]), \(position[1])")
                        // add valid neighbors
                        var neighbors: [(Int, Int)] = [(currRow, currCol-1), (currRow, currCol+1), (currRow+1, currCol), (currRow-1, currCol)]
            
                        for (nr, nc) in neighbors where validate2(nr, nc) {
                            queue.append([nr, nc, currDistance+1]) //currDistance is the distance
                        }

                        markDistances(currRow, currCol, currDistance)
                    }
                    // visitedOnes = Array(repeating: Array(repeating: false, count: LENGTH), count: LENGTH)
                }
            }
        }
        

        return minDistance
    }
}


// var a = [[0,1],[1,0]]
// var b = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]


var c = [[0,1,0,0,0],[0,1,0,1,1],[0,0,0,0,1],[0,0,0,0,0],[0,0,0,0,0]]
var d = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,0,0,0],[0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,1,1,0],[0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0],[0,0,0,0,0,0,0,0,0,1,0,1,1,0,0,1,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0]]
print(Solution().shortestBridge(d))
