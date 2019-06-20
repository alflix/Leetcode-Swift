/**
 给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。
 
 如果不存在最后一个单词，请返回 0 。
 
 说明：一个单词是指由字母组成，但不包含任何空格的字符串。
 
 示例: 
 输入: "Hello World"
 输出: 5
 
 思路：从后往前遍历，遇到非空格 +1，遇到空格就返回。
 
 时间复杂度：O(n)
 空间复杂度：O(1)
 */

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let array = Array(s)
        var length = 0 
        var flag = false
        
        var index = array.count - 1
        while index >= 0 {
            if array[index] != " " {
                length += 1
                flag = true
            } else if flag {
                return length
            }
            index -= 1
        }        
        return length
    }
}

let test = Solution()
print(test.lengthOfLastWord("hello world"))
