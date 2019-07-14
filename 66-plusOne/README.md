### [66. 加一](https://leetcode-cn.com/problems/plus-one/)

#### 题目

给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
你可以假设除了整数 0 之外，这个整数不会以零开头。

示例 1:
输入: [1,2,3]
输出: [1,2,4]
解释: 输入数组表示数字 123。

示例 2:
输入: [4,3,2,1]
输出: [4,3,2,2]
解释: 输入数组表示数字 4321。

#### 思路

创建一个 while 循环，如果某一位等于 9，则设置为 0（9+1=10 进位），下一位继续操作。

但某一位小于 9 时，提前终止返回。

如果没有提前返回，那就是 [9,9,9,9] 这种情况了，需要插入 1 在首位（[1,0,0,0,0]） 

#### 复杂度

时间复杂度：O(n)
空间复杂度：O(1)

#### 解法

```swift
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var index = digits.count - 1
        while index >= 0 {
            if digits[index] < 9 {
                digits[index] += 1
                return digits
            }
            digits[index] = 0
            index -= 1
        }
        digits.insert(1, at: 0)
        return digits
    }
}

let test = Solution()
print(test.plusOne([1,3,4,5]))
```