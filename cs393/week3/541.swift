func reverseStr(_ s: String, _ k: Int) -> String {
    var res = Array(s)
    guard s.count > k else { return String(res.reversed())}
    for i in stride(from: 0, to: s.count, by: 2*k) {
        var r = min(s.count, i+k)
        res[i..<r].reverse()
    }
    return String(res)
}



// func reverseStr(_ s: String, _ k: Int) -> String {

//     var res = Array(s)
//     if k > s.count { return String(res.reversed()) }
//     var l = res.startIndex
//     var r = res.startIndex

//     var swapping = true
//     var c = 1

//     while r < res.endIndex {
//         if c == k || r+1==res.endIndex{
//             if swapping {
//                 res[l...r].reverse()
//             } 
//             l = res.index(after: r)
//             c = 1
//             swapping.toggle()
//         } else {
//             c += 1
//         }

//         r = res.index(after: r)
//     }
//     return String(res)
// }

var a = "abcdefg"
var k = 3
var res = "cbadefg"

print(reverseStr(a, k) == res)