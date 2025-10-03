func reverseList(_ head: ListNode?) -> ListNode? {
    var curr = head
    var l: ListNode? = nil

    while (curr != nil){
        var next = curr!.next //so we can traverse to that one
        curr!.next = l
        //move the pointer
        l = curr
        curr = next
    }
    return l
}
 
public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
