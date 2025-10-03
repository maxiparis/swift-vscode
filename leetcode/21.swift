public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// MARK: Solution 1
// func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//     var current1 = list1
//     var current2 = list2

//     //both from the new list
//     var head: ListNode? = nil
//     var tail: ListNode? = head

//     while (current1 != nil || current2 != nil) {
//         var toAppendToTail = current1 //just to initialize

//         if current1?.val ?? Int.max < current2?.val ?? Int.max {
//             toAppendToTail = current1
//             current1 = current1?.next
//         } else {
//             toAppendToTail = current2
//             current2 = current2?.next
//         }

//         if head != nil { // we are not in the beginning
//             tail!.next = toAppendToTail
//             toAppendToTail!.next = nil
//             tail = toAppendToTail
//         } else { // we are in the first node
//             head = toAppendToTail
//             head!.next = nil
//             tail = head
//         }
//     }


//     return head
// }


//MARK: Solution 2 - Optimized
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var current1 = list1
    var current2 = list2

    let dummy = ListNode(0) // Handles edge cases
    var tail: ListNode = dummy

    while (current1 != nil || current2 != nil) {
        var toAppendToTail = current1 // Just to initialize

        if current1?.val ?? Int.max < current2?.val ?? Int.max {
            toAppendToTail = current1
            current1 = current1?.next
        } else {
            toAppendToTail = current2
            current2 = current2?.next
        }

        tail.next = toAppendToTail!
        tail = toAppendToTail!
    }

    return dummy.next
}

// [1,2]
// [1,3]

let a1 = ListNode(1)
let a2 = ListNode(2)

a1.next = a2

let b1 = ListNode(1)
let b2 = ListNode(3)

b1.next = b2

mergeTwoLists(a1, b1)