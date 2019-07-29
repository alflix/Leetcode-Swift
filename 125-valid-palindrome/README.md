### [125. 验证回文串](https://leetcode-cn.com/problems/valid-palindrome/)

#### 题目

 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 
 说明：本题中，我们将空字符串定义为有效的回文串。
 
 示例 1:
 输入: "A man, a plan, a canal: Panama"
 输出: true
 
 示例 2:
 输入: "race a car"
 输出: false

#### 思路

双指针，while 循环，判断～

#### 复杂度

时间复杂度：O(n)

空间复杂度：O(1)

#### 解法

```swift
extension Character {
    var isLetterOrDigit: Bool {
        return isLetter || isNumber
    }
}

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.count == 0 { return true }
        let lowerS = Array(s.lowercased())
        var i = 0
        var j = lowerS.count - 1
        while i < j {
            while i < j && !lowerS[i].isLetterOrDigit {
                i += 1
            }
            while i < j && !lowerS[j].isLetterOrDigit {
                j -= 1
            }
            if lowerS[i] != lowerS[j] { 
                return false                 
            }
            i += 1
            j -= 1
        }        
        return true
    }

    func test() {
        print(isPalindrome("A man, a plan, a canal: Panama"))
        print(isPalindrome("race a car"))
    }
}
```
