### [344. 反转字符串](https://leetcode-cn.com/problems/reverse-string/)

#### 题目

编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。

 示例 1：
 输入：["h","e","l","l","o"]
 输出：["o","l","l","e","h"]

 示例 2：
 输入：["H","a","n","n","a","h"]
 输出：["h","a","n","n","a","H"]

#### 思路

交换左右指针

#### 复杂度

时间复杂度: O(n)

空间复杂度: O(1)

#### 解法

```swift
class Solution {
    func reverseString(_ s: inout [Character]) {
        guard s.count > 0 else { return }
        var left = 0
        var right = s.count - 1

        while left < right {
            let tmp = s[left]
            s[left] = s[right]
            s[right] = tmp
            left += 1
            right -= 1
        }
    }
}

let solution = Solution()
var characters: [Character] = ["h","e","l","l","o"]
solution.reverseString(&characters)
print(characters)
```