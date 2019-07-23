### [121. 买卖股票的最佳时机](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/)

#### 题目

给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
 
如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。

注意你不能在买入股票前卖出股票。

示例 1:

输入: [7,1,5,3,6,4]
输出: 5

解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。

注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。

示例 2:

输入: [7,6,4,3,1]
输出: 0

解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。

#### 思路

将数组绘制成折线图，答案可以转换为，找到最小的谷和之后的最大的峰。

因此，遍历数组，找到最小的值。遍历过程中，找到最大的差值

#### 复杂度

时间复杂度：O(n)

空间复杂度：O(1)

#### 解法

```swift
class Solution {            
    func maxProfit(_ prices: [Int]) -> Int {
        var minprice = Int.max
        var maxProfix = 0
        var index = 0
        while index < prices.count {
            if prices[index] < minprice {
                minprice = prices[index]
            } else if prices[index] - minprice > maxProfix {
                maxProfix = prices[index] - minprice
            }
            index += 1
        }        
        return maxProfix
    }
}

let test = Solution()
print(test.maxProfit([7,1,5,3,6,4]))
```

