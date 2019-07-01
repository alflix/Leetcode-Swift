/**
 给定两个二叉树，编写一个函数来检验它们是否相同。
 
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 
 示例 1: 
 输入:       1         1
 / \       / \
 2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 输出: true
 
 示例 2:
 输入
```
  1         1
 / \       / \
 2   3     2   3
 
 [1,2,3],   [1,2,3]
```
 
 [1,2],     [1,null,2] 
 输出: false
 
 示例 3:
 输入:
 1         1
 / \       / \
 2   1     1   2
 
 [1,2,1],   [1,1,2]
 
 输出: false
 

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
