/**
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 
 思路：一次循环肯定是必须的。在循环 for num in nums 中，我们用 sum 代表最大连续子序列和，如果 sum < 0, 下次循环中那再加上 sum 肯定更小了，所以抛弃掉，sum = num。如果 sum > 0, 而 num 不管是否 >0 我们都必须加上，防止后面的循环中还有更大的 num。
 最后，我们用一个额外的值，随时记录最大的 sum
 
 时间复杂度：O(n)
 空间复杂度：O(1)
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var result = nums.first!
        var sum = 0
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            result = max(result, sum)
        }
        return result
    }
}

let test = Solution()
print(test.maxSubArray([-2, 3, -1, 1, -3])) 
