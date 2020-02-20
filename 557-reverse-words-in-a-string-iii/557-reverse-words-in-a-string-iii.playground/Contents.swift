/**
 链接: https://leetcode-cn.com/problems/reverse-words-in-a-string-iii/

 给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

 示例 1:
 输入: "Let's take LeetCode contest"
 输出: "s'teL ekat edoCteeL tsetnoc"

 注意：在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。

 思路：遍历字符串转换出来的数组，用栈 push，遇到空格 pop 依次拼接到新的字符串中

 时间复杂度: O(n)
 空间复杂度: O(n)
 */

class Solution {
    func reverseWords(_ s: String) -> String {
        let characters = Array(s)
        var stack: [Character] = []
        var result = ""
        for character in characters {
            if character != " " {
                stack.append(character)
            } else {
                while !stack.isEmpty {
                    result.append(stack.popLast() ?? " ")
                }
                result.append(" ")
            }
        }
        while !stack.isEmpty {
            result.append(stack.popLast() ?? " ")
        }
        return result
    }
}

let solution = Solution()
let result = solution.reverseWords("Let's take LeetCode contest")
