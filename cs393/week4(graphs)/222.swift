import Foundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

}


class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        var leftHeight = getHeightLeft(root)
        var rightHeight = getHeightRight(root)

        if leftHeight == rightHeight {
            return nodesPerHeight(height: leftHeight)
        }

        return 1 + countNodes(root.left) + countNodes(root.right)
    }

    func getHeightLeft(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }
        return getHeightLeft(node.left)
    }

    func getHeightRight(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }
        return 1 + getHeightLeft(node.right)
    }


    func nodesPerHeight(height: Int) -> Int {
        return power(2, to: height+1) - 1  // 2^(h+1) - 1
    }

    func power(_ this: Int, to power: Int) -> Int {
        return Int(pow(Double(this),Double(power))) // SOMEHTING I LEARNED
    }
}

let s = Solution()
print(s.nodesPerHeight(height: 0))