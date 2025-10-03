class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var numbOfIslands = 0
        var queue: [[Int]] = [] //[row, col]
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == "1" {
                    numbOfIslands += 1
                    grid[row][col] = "0"
                    queue.append([row+1, col])
                    queue.append([row-1, col])
                    queue.append([row, col+1])
                    queue.append([row, col-1])


                    while !queue.isEmpty {
                        var first = queue.removeFirst()

                        if (0..<grid.count) ~= first[0] && (0..<grid[0].count) ~= first[1] && grid[first[0]][first[1]] == "1"{
                            grid[first[0]][first[1]] = "0"
                            queue.append([first[0]+1, first[1]])
                            queue.append([first[0]-1, first[1]])
                            queue.append([first[0], first[1]+1])
                            queue.append([first[0], first[1]-1])
                        }
                    }
                }
            }
            
        }

        return numbOfIslands
    }
}