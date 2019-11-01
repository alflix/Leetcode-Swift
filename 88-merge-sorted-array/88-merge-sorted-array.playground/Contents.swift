/**
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 
 说明:
 
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 
 示例: 
 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 输出: [1,2,2,3,5,6]
 
 思路：通过2个指针，p1 和 p2，遍历数组，比较 p1 p2 所在元素的大小，小的放进数组中。所以时间复杂度：O(n+m)，空间复杂度 O(m)。
 因为需要创建一个新的数组来保存 num1 的元素。
 为了优化空间复杂度，我们可以用原来的 num1 数组，只要从后往前遍历即可（看题目，num1 有足够的空间）
 需要注意的是处理好 p1, p2 < 0 的情况
 时间复杂度：O(n)
 空间复杂度：O(1)
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard n > 0 else { return }
        if m == 0 {
            nums1 = nums2
            return
        }
        var p1 = m - 1
        var p2 = n - 1
        var p = m + n - 1
        while p1 >= 0 || p2 >= 0 {
            if p2 < 0 || (p1 >= 0 && nums1[p1] > nums2[p2]) {
                nums1[p] = nums1[p1]
                p1 -= 1
            } else {
                nums1[p] = nums2[p2]
                p2 -= 1
            }
            p -= 1
        }
    }
}

let test = Solution()
var nums1 = [2, 0]
let nums2 = [1]
test.merge(&nums1, 1, nums2, 1)
print(nums1)
