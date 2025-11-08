// 88. Merge Sorted Array

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        //store the result in nums1

        if n == 0 { return }
        if m == 0 { 
            nums1 = nums2
            return
        }

        var tmp: [Int] = []

        var t = 0 //nums1 index
        var b = 0 //nums2 index

        while tmp.count < n+m {
            var nums2ended = b == n
            if (nums2ended || nums1[t] <= nums2[b]) && t < m {
                tmp.append(nums1[t])
                t += 1
            } else {
                tmp.append(nums2[b])
                b += 1
            }
        }


        nums1 = tmp
    }
}

var a = [2,0]
var b = [1]
print(Solution().merge(&a, 1, b, 1))