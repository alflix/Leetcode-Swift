### [70. 爬楼梯](https://leetcode-cn.com/problems/climbing-stairs/)

假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

注意：给定 n 是一个正整数。

示例 1：
输入： 2
输出： 2
解释： 有两种方法可以爬到楼顶。
1.  1 阶 + 1 阶
2.  2 阶

示例 2：
输入： 3
输出： 3
解释： 有三种方法可以爬到楼顶。
1.  1 阶 + 1 阶 + 1 阶
2.  1 阶 + 2 阶
3.  2 阶 + 1 阶

思路：动态规划

本问题可以分成多个子问题，爬第n阶楼梯的方法数量，等于 2 部分之和

1.爬上 n-1n−1 阶楼梯的方法数量。因为再爬1阶就能到第n阶
3.爬上 n-2n−2 阶楼梯的方法数量，因为再爬2阶就能到第n阶

所以我们得到公式 dp[n] = dp[n-1] + dp[n-2]dp[n]=dp[n−1]+dp[n−2]

同时需要初始化 dp[0]=1dp[0]=1 和 dp[1]=1dp[1]=1

时间复杂度：O(n)
空间复杂度：O(1)


```swift
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        var i = 2
        while i <= n {
            dp[i] = dp[i-1] + dp[i-2]
            i += 1
        }
        return dp[n]
    }
}

let test = Solution()
print(test.climbStairs(2))
```

