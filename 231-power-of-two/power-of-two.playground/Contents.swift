/**
链接: https://leetcode-cn.com/problems/power-of-two/

给定一个整数，编写一个函数来判断它是否是 2 的幂次方。

示例 1:
输入: 1
输出: true
解释: 20 = 1

示例 2:
输入: 16
输出: true
解释: 24 = 16

示例 3:
输入: 218
输出: false

思路：和2相关的题目，都要先考虑位运算。

 推算一下，有如下规律

 2^0 1
 2^1 10                    2^1 - 1    1
 2^2 100                  2^2 - 1    011
 2^3 1000                2^3 - 1    0111
 2^4 10000              2^4 - 1    01111

 恒有 n & (n - 1) == 0，这是因为：
 n 二进制最高位为 1，其余所有位为 0；
 n - 1 二进制最高位为 0，其余所有位为 1；

时间复杂度: O(1)
空间复杂度: O(1)
*/

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && (n & (n - 1) == 0)
    }
}

let s = Solution()
s.isPowerOfTwo(1024)


