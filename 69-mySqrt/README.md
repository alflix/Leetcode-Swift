### [69. x 的平方根](https://leetcode-cn.com/problems/sqrtx/)

实现 int sqrt(int x) 函数。
计算并返回 x 的平方根，其中 x 是非负整数。
由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

示例 1:
输入: 4
输出: 2

示例 2:
输入: 8
输出: 2

说明: 8 的平方根是 2.82842..., 
          由于返回类型是整数，小数部分将被舍去。

思路：需要强记解法 牛顿法（https://en.wikipedia.org/wiki/Newton%27s_method）
即套用牛顿迭代公式：r = (r + x/r)/2，然后暴力解法

时间复杂度：O(logN)
空间复杂度：O(1)


```swift
import Foundation

class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 0 else { return 0 }
        let x: Double = Double(x)
        var r: Double = 1
        while fabs(r*r - x) > 0.5 {
            r = (r + x/r)/2
        }
        return Int(r)
    }
}

let test = Solution()
print(test.mySqrt(4))
```

