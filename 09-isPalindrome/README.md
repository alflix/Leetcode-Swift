### [9.回文数](https://leetcode-cn.com/problems/reverse-integer/)

```
判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 示例 1:
 输入: 121
 输出: true

 示例 2:
 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。

 示例 3:
 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
```

方法：和整数反转的思路一样，对输入值进行反转，相同即为回文数。

 不过，不需要反转整个数字，只需要反转一半的数字，相同即可。

 此外，还需要处理负数和 0 两种特殊情况（第一位为0时，只有是0才满足回文数条件）



 复杂度分析

 时间复杂度：o(log10(x))

 空间复杂度：o(1)

```swift
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var x = x
        var revertedNumber = 0
        while x > revertedNumber {
            revertedNumber = revertedNumber * 10 + x % 10
            x /= 10
        }
        return x == revertedNumber || x == revertedNumber / 10
    }

    func test() {
        print(isPalindrome(12321))
    }
}

let solution = Solution()
solution.test()
```

