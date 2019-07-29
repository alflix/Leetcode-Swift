/**
 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 
 说明：本题中，我们将空字符串定义为有效的回文串。
 
 示例 1:
 输入: "A man, a plan, a canal: Panama"
 输出: true
 
 示例 2:
 输入: "race a car"
 输出: false

 方法：匹配问题，我们一般使用 栈
 遍历字符串，我们把左括号压入栈中，当遇到右括号，和栈顶元素比较！

 时间复杂度：O(n)
 空间复杂度：O(n)

 */

import Foundation

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.count == 0 { return true }
        let lowerS = s.lowercased()
        var i = 0
        var j = lowerS.count - 1
        while i < j {
            while i < j && lowerS[i]. {
                <#code#>
            }
            if lowerS[i] != lowerS[j] { return false }
        }
        
        return false
    }


    func test() {
        print(isPalindrome("A man, a plan, a canal: Panama"))
        print(isPalindrome("race a car"))
    }
}

let solution = Solution()
solution.test()
