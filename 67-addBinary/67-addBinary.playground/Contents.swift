/**
 给定两个二进制字符串，返回他们的和（用二进制表示）。
 
 输入为非空字符串且只包含数字 1 和 0。
 
 示例 1:
 输入: a = "11", b = "1"
 输出: "100"
 
 示例 2:
 输入: a = "1010", b = "1011"
 输出: "10101"
 
 思路：从后往前遍历2个数，设置一个数 carry 用于记录进位，进位为2个数之和的除2，新的位数 sum 为2个数之和的余2，最后再把 sum 拼接起来，即为结果。
 
 时间复杂度：O(n)
 空间复杂度：O(1)
 */

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var sum = 0, carry = 0, res = ""
        let aChars = Array(a), bChars = Array(b)
        var i = aChars.count - 1, j = bChars.count - 1
        
        while i >= 0 || j >= 0 || carry > 0 {
            sum = carry
            if i >= 0 {
                sum += Int(String(aChars[i]))!
                i -= 1
            }
            if j >= 0 {
                sum += Int(String(bChars[j]))!
                j -= 1
            }
            carry = sum / 2
            sum = sum % 2
            res = String(sum) + res
        }        
        return res
    }
}

let test = Solution()
print(test.addBinary("10", "10"))
