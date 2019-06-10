/**
 实现 strStr() 函数。
 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。

 示例 1:
 输入: haystack = "hello", needle = "ll"
 输出: 2

 示例 2:
 输入: haystack = "aaaaa", needle = "bba"
 输出: -1

 方法：
 时间复杂度：O(m+n)
 空间复杂度：O(n)
 */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 { return 0 }
        var i = 0
        for j in nums {
            if j != val {
                nums[i] = j
                i += 1
            }
        }
        return i
    }
}

let test = Solution()
var i = [3,2,2,3]
test.removeElement(&i, 2)

