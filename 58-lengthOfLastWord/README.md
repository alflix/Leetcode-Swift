### [58. 最后一个单词的长度](https://leetcode-cn.com/problems/length-of-last-word/)

#### 题目

给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。

如果不存在最后一个单词，请返回 0 。

说明：一个单词是指由字母组成，但不包含任何空格的字符串。

示例: 
输入: "Hello World"
输出: 5

#### 思路

从后往前遍历，遇到非空格 +1，遇到空格就返回。

#### 复杂度

时间复杂度：O(n)

空间复杂度：O(1)

#### 解法
```swift
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let rs = Array(s.reversed())
        var length = 0 
        var flag = false
        for c in rs {
            if c != " " {
                length += 1
                flag = true
            } else if flag {
                return length
            }
        }
        return length
    }
}

let test = Solution()
print(test.lengthOfLastWord("a "))
```