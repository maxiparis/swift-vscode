
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
    func maxDepth(_ root: TreeNode?) -> Int {
        return traverse(root)
    }

    func traverse(_ node: TreeNode?) -> Int {
        guard node != nil else { return 0 }
        let n = node!
        return 1 + Swift.max(traverse(n.left), traverse(n.right))
    }
}