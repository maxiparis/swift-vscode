func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    if (left == right) {
        return head
    }

    var dummyHead = ListNode(Int.max)
    dummyHead.next = head

    var outerLeft: ListNode? = head
    var outerRight: ListNode? = nil
    var innerHead: ListNode? = nil
    var innerTail: ListNode? = nil

    var prev = dummyHead
    var headRemoved = false

    var i = 0
    var curr: ListNode? = dummyHead

    while curr != nil {
        if (i == left-1) {
            outerLeft = curr!
            curr = curr!.next

        } else if (i == left) {         // perform the reversal
            innerTail = curr!
            var tempNext = curr!.next
            curr!.next = nil
            prev = curr!
            curr = tempNext
        } else if (left < i && i < right) {  // perform the reversal
            var tempNext = curr!.next
            curr!.next = prev
            prev = curr!
            curr = tempNext
        } else if (i == right){         // perform the reversal
            // innerHead = curr
            outerRight = curr!.next
            outerLeft?.next = curr!
            curr!.next = prev
            innerTail?.next = outerRight

            // if dummyHead.next === innerTail!.next {
            //     dummyHead.next = innerTail
            // }
            break
        } else {
            curr = curr!.next
        }

        i += 1
    }

    //what do i return? 
    return dummyHead.next
}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


// Create 5 nodes
let node1 = ListNode(3)
let node2 = ListNode(5)


// Connect the nodes
node1.next = node2



// Now node1 is the head of the linked list
reverseBetween(node1, 1, 2)



