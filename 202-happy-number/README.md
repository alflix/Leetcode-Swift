### [198. 打家劫舍](https://leetcode-cn.com/problems/house-robber/)

#### 题目

编写一个算法来判断一个数是不是“快乐数”。

一个“快乐数”定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个过程直到这个数变为 1，也可能是无限循环但始终变不到 1。如果可以变为 1，那么这个数就是快乐数。

示例:

输入: 19
输出: true
解释:
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1

#### 思路

动态规划 (找出一般规律)

动态规划方程：dp[n] = MAX( dp[n-1], dp[n-2] + num )

由于不可以在相邻的房屋闯入，所以在当前位置 n 房屋可盗窃的最大值，要么就是 n-1 房屋可盗窃的最大值，要么就是 n-2 房屋可盗窃的最大值加上当前房屋的值，二者之间取最大值

举例来说：1 号房间可盗窃最大值为 3 即为 dp[1]=3，2 号房间可盗窃最大值为 4 即为 dp[2]=4，3 号房间自身的值为 2 即为 num=2，那么 dp[3] = MAX( dp[2], dp[1] + num ) = MAX(4, 3+2) = 5，3 号房间可盗窃最大值为 5

#### 复杂度

时间复杂度：O(n)
空间复杂度：O(1)

#### 解法

```swift
class Solution {
    func rob(_ nums: [Int]) -> Int {
        let len = nums.count
        guard len > 0 else { return 0 }
        var dp = Array(repeating: 0, count: len + 1)
        dp[0] = 0
        dp[1] = nums[0]
        var i = 2
        while i <= len {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i-1])
            i += 1
        }
        return dp[len]
    }
}
```