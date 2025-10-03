public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
func reverseList(_ head: ListNode?) -> ListNode? {
    var curr = head
    var left: ListNode? = nil
    while (curr != nil) {
        var right = curr?.next
        curr?.next = left
        left = curr
        curr = right 
    }
    return left
}

var node2 = ListNode(2) 
var node1 = ListNode(1, node2)

var result = reverseList(node1)
