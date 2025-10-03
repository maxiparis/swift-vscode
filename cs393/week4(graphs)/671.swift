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
    var s = Set<Int>()
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        inorder(root)
        var a: [Int] = Array(s).sorted()
        return a.count <= 1 ? -1 : a[1]
    }

    func inorder(_ node: TreeNode?) {
        guard let node else { return }
        inorder(node.left)
        s.insert(node.val)
        inorder(node.right)
    }
}