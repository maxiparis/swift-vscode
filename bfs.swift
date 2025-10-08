import Foundation
//objective is to mark each cell with the distances from the start point
func bfs(_ length: Int, _ startPoint: (Int, Int)){
    var LENGTH_RANGE = 0..<length
    var row = startPoint.0
    var col = startPoint.1
    guard LENGTH_RANGE ~= startPoint.0 && LENGTH_RANGE ~= startPoint.1 else { return }
    var grid = Array(repeating: Array(repeating: 0, count: length), count: length)

    var queue: [[Int]] = [] 
    var visited = Array(repeating: Array(repeating: false, count: length), count: length)
    visited[row][col] = true

    queue.append([row, col, 1])
    
    var queueIndex = 0

    while queueIndex < queue.count {
        var currRow = queue[queueIndex][0]
        var currCol = queue[queueIndex][1]
        var currDistance = queue[queueIndex][2]
        print("in \(currRow), \(currCol)")
        queueIndex += 1

        var neighbors = [(currRow+1, currCol), (currRow-1, currCol), (currRow, currCol+1), (currRow, currCol-1)]

        for (nr, nc) in neighbors {
            guard LENGTH_RANGE ~= nr && LENGTH_RANGE ~= nc && !visited[nr][nc] else { continue } 
            visited[nr][nc] = true
            queue.append([nr, nc, currDistance+1])
            grid[nr][nc] = currDistance
        }
        print2DArray(grid)
    }
}

func print2DArray(_ grid: [[Int]]) {
    for row in grid {
        print(row.map { String($0).padding(toLength: 2, withPad: " ", startingAt: 0) }.joined(separator: " "))
    }
}

bfs(20, (3,3))