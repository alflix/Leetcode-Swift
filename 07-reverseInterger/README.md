### [7.整数反转](https://leetcode-cn.com/problems/reverse-integer/)

```
给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

示例 1:
输入: 123
输出: 321

示例 2:
输入: -123
输出: -321

示例 3:
输入: 120
输出: 21
```

 方法：从尾部开始弹出数字，再从头部开始推入数字。注意需要在溢出前进行检查

 复杂度分析

 时间复杂度：O(log(x))

 空间复杂度：O(1)

```swift
class Solution {
     func reverse(_ x: Int) -> Int {
        var x = x
        var rev = 0
        while x != 0 {
            let pop = x % 10
            x /= 10
            if rev > Int32.max / 10 || rev == Int32.max / 10 && pop > Int32.max % 10 { return 0 }
            if rev < Int32.min / 10 || rev == Int32.min / 10 && pop < Int32.min % 10 { return 0 }
            rev = rev * 10 + pop
        }
        return rev
    }

    func test() {
        print(reverse(1463847412))
    }
}

let solution = Solution()
solution.test()
```

