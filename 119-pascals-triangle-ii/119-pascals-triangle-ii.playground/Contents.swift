/**
给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。

在杨辉三角中，每个数是它左上方和右上方的数的和。
 
示例:
输入: 3
输出: [1,3,3,1]
 
思路：先基于 k 创建 k+1 大小的数组，然后开始2层遍历
第一层遍历基于 k 的 index 值，并从 1 开始，k-1 结束（0和k所在的值肯定是1）
 
然后观察下规律：

[1],            -- 0
[1,1],          -- 1    
[1,2,1],        -- 2
[1,3,3,1],      -- 3
[1,4,6,4,1]     -- 4

例如 k ==3 的时候，可以看到 index == 1 的值为 3， k ==4 的时候，可以看到 index == 1 的值为 4
也就是，k index 所在的值（不包含 0 和 k），等于 1 +（k-1次 +1 的遍历操作）

时间复杂度：O(n)
空间复杂度：O(nlogn)
 */

class Solution {            
    func getRow(_ rowIndex: Int) -> [Int] {
        var triangle = Array(repeating: 1, count: rowIndex+1)
        guard rowIndex > 0 else { return triangle }
        triangle[0] = 1
        guard rowIndex > 1 else { return triangle }
        for i in 1...rowIndex-1 {
            var j = i
            while j >= 1 {
                triangle[j] += triangle[j-1]
                j -= 1
            }                                     
        }
        return triangle
    }
}

let test = Solution()
print(test.getRow(4))


