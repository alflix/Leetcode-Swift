/**
给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。

在杨辉三角中，每个数是它左上方和右上方的数的和。
 
示例:
输入: 3
输出: [1,3,3,1]
 
思路：动态规划，基于前一行来构造每一行。

注意边界条件:
 
- n == 0，直接返回空
- n == 1, 返回 [[1]], 此时未进入第一层循环
- n == 2, 返回 [[1, 1]], 此时未进入第二层循环
- n > 2, 返回 [[1, 2, 1]], 此时进入了第二层循环，第二层循环中，2 = previousRow[0] + previousRow[1] = 1 + 1
- ...

时间复杂度：O(n2)
空间复杂度：O(n2)
 */

class Solution {            
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle: [[Int]] = []
        guard numRows > 0 else { return triangle }
        triangle.append([1])
        guard numRows > 1 else { return triangle }
        for num in 1...numRows-1 {
            var row: [Int] = [1]
            let previousRow = triangle[num - 1]
            if previousRow.count > 1 {
                for i in 1...previousRow.count - 1 {                
                    row.append(previousRow[i-1] + previousRow[i])
                }
            }                         
            row.append(1)
            triangle.append(row)
        }
        return triangle
    }
}

let test = Solution()
print(test.generate(1))


