class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        var originalColor = image[sr][sc]

        var queue: [[Int]] = [] //row,col
        if image[sr][sc] != color {
            queue.append([sr, sc])
        }

        while !queue.isEmpty {
            var front = queue.removeFirst()
            var row = front[0]
            var col = front[1]
            if (0..<image.count) ~= row && (0..<image[0].count) ~= col && image[row][col] == originalColor {
                image[row][col] = color
                queue.append([row+1, col])
                queue.append([row-1, col])
                queue.append([row, col+1])
                queue.append([row, col-1])
            }
        }

        return image
    }
}


print(Solution().floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2))