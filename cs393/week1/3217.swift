public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

 
func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
    var currHead = head
    var curr = head
    var prev: ListNode? = nil
    let containedInNums: Set<Int> = Set(nums)
    
    while (curr != nil) {
        if (containedInNums.contains(curr!.val)) {
            //remove
            prev?.next = curr!.next
            if (prev == nil) { currHead = curr!.next }
        } else {
            prev = curr
        }

        //move curr forward
        curr = curr!.next
    }

    return currHead
}


var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(3)

node1.next = node2
node2.next = node3

var result = modifiedList([2], node1)