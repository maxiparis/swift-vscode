//https://leetcode.com/problems/binary-tree-inorder-traversal/description/
// Definition for a binary tree node.
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
 
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var a: [Int] = []
    traverse(root, a: &a)
    return a
}

func traverse(_ node: TreeNode?, a: inout [Int]) {
    guard node != nil else { return }
    traverse(node!.left, a: &a)
    a.append(node!.val)
    traverse(node!.right, a: &a)
}


var one = TreeNode(1)
var two = TreeNode(2)
var three = TreeNode(3)

one.right = two
two.left = three

print(inorderTraversal(one))