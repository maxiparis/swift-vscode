 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

// class Solution {
//     func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//         var first: [ Int: [ListNode] ] = [:]

//         var current = headA
//         while current != nil {
//             first[current!.val, default: []].append(current!)
//             current = current?.next
//         }

//         current = headB
//         while current != nil {
//             if let found = first[current!.val] {
//                 for innerNode in found {
//                     if current === innerNode { return innerNode }
//                 }
//             }
//             current = current?.next
//         }

//         return nil
//     }
// }


class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var first: [ Int: [ListNode] ] = [:]

        var up = headA
        var down = headB

        while up !== down {
            up = up == nil ? headB : up!.next
            down = down == nil ? headA : down!.next
        }

        return up
    }
}