### [28. 实现strStr()](https://leetcode-cn.com/problems/implement-strstr/)

#### 题目

实现 strStr() 函数。
给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。

示例 1:
输入: haystack = "hello", needle = "ll"
输出: 2

示例 2:
输入: haystack = "aaaaa", needle = "bba"
输出: -1

#### 思路

这道题必须记住使用 KMP 算法。KMP 算法，简单来讲，就是通过两个指针 i 和 j 在字符串和匹配字符串上面移动，遇到不匹配的就重置指针。重置指针的过程，可以通过 KMP 算法优化 j 指针回退的步数。

这个算法的核心就是求 next() 数组。next() 数组即：匹配字符串各个子串的最长前缀后缀。如何求呢：

通过例子来解释：

例子：

```
 01234567
 abababca

 k:-1 j:0  [-1]               --------- 0
 k:0  j:1  [-1,0]             --------- 1
 k:0  j:2  [-1,0,0]           --------- 2
 k:1  j:3  [-1,0,0,1]         --------- 3
 k:2  j:4  [-1,0,0,1,2]       --------- 4
 k:3  j:5  [-1,0,0,1,2,3]     --------- 5
 k:4  j:6  [-1,0,0,1,2,3,4]   --------- 6
 --- k = next[k] (思路见下)
 k:2  j:6
 --- k = next[k]
 k:0  j:6
 --- k = next[k]
 k:-1 j:6  [-1,0,0,1,2,3,4,0] --------- 7
```

思路：此刻 p(4) 和 p (6) 已经不匹配了，所以我们要找更短的相同前缀后缀，假设新的长度为k，此时P[0]~P[k-1]和P[q-k]~P[q-1]依次相同。如何求 k 呢？

next[k]表示p[k]前面有相同前缀尾缀的长度(这个长度是按最大算的)，p[next[k]]表示相同前缀的最后一个字符，如果p[next[k]]==p[k]，则可以肯定next[k+1]=next[k]+1,如果p[next[k]]!=p[k]，则思考，既然next[k]长度的前缀尾缀都不能匹配了，是不是应该缩短这个匹配的长度，到底缩短多少呢，

next[next[k]]表示p[next[k]]前面有相同前缀尾缀的长度(这个长度是按最大算的)，所以一直递推就可以了，因为这个缩小后的长度都是按最大的算的

#### 复杂度

时间复杂度：O(m+n)

空间复杂度：O(n)

#### 解法

```swift
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hChars = Array(haystack), nChars = Array(needle)
        let hCount = hChars.count, nCount = nChars.count
        guard hCount > nCount else { return -1 }

        var i = 0, j = 0
        while i < hCount && j < nCount {
            if j == -1 || hChars[i] == nChars[j] {
                i += 1
                j += 1
            } else {
                j = next(needle)[j]
            }
        }
        if j == nCount {
            return i - j
        }
        return -1
    }

    func next(_ p: String) -> [Int] {
        let nChars = Array(p)
        let nCount = nChars.count
        var zeta: [Int] = [Int](repeating: -1, count: nCount)
        var k = -1
        var j = 0
        while j < nCount-1 {
            if k == -1 || nChars[k] == nChars[j] {
                k += 1
                j += 1
                zeta[j] = k
            } else {
                k = zeta[k]
            }
        }
        return zeta
    }
}
```
