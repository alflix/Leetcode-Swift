/*
 给定一个正整数 n，生成一个包含 1 到 n^2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。

 示例:

 输入: 3
 输出:
 [
  [ 1, 2, 3 ],
  [ 8, 9, 4 ],
  [ 7, 6, 5 ]
 ]

思路：构建矩阵，填充矩阵的思路，填充过程分为四种情况：

从左到右填充一行
从上到下填充一列
从右到左填充一行
从下到上填充一列

如果还有下一层，继续上面的操作。

如果 n 是奇数，会有最后一个中间的数未填充，补充之。

 */

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        guard n > 0 else {
            return [[Int]]()
        }

        var num = 1
        var res = Array(repeating: Array(repeating: 0, count: n), count: n)

        for layer in 0 ..< n / 2 {
            let start = layer
            let end = n - layer - 1

            // top
            for i in start ..< end {
                res[start][i] = num
                num += 1
            }

            // right
            for i in start ..< end {
                res[i][end] = num
                num += 1
            }

            // bottom
            for i in stride(from: end, to: start, by: -1) {
                res[end][i] = num
                num += 1
            }

            // left
            for i in stride(from: end, to: start, by: -1) {
                res[i][start] = num
                num += 1
            }
        }

        // handle the center one
        if n % 2 != 0 {
            res[n/2][n/2] = n * n
        }

        return res
    }
}

let s = Solution()
let r = s.generateMatrix(3)
