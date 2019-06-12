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
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hChars = Array(haystack), nChars = Array(needle)
        let hCount = hChars.count, nCount = nChars.count

        guard hCount >= nCount else { return -1 }
        if nCount == 0 { return -1 }

        var i = 0, j = 0
        while i < hCount && j < nCount {
            if j == -1 || hChars[i] == nChars[j] {
                i += 1
                j += 1
            } else {

            }
        }
        if j == nCount {
            return i - j
        }
        return -1
    }

    func next(_ needle: String) -> [Int] {
        let nChars = Array(needle)
        let nCount = nChars.count
        var next: [Int] = [-1]
        let k = -1
        let j = 0
        while j < nCount-1 {

        }


        return [0]
    }
}

let test = Solution()
test.strStr("hello", "ll")

