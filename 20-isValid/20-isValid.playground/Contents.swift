/**
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。

 示例 1:

 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:

 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:

 所有输入只包含小写字母 a-z 。

 方法：

 复杂度分析
 时间复杂度：o(n)
 空间复杂度：o(1)
 */

struct Stack {
    fileprivate var array: [Character] = []
    
    mutating func push(_ element: Character) {
        array.append(element)
    }
    
    mutating func pop() -> Character? {
        return array.popLast()
    }
    
    func isEmpty() -> Bool {
        return array.count == 0
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 > 0 {
            return false
        }
        var stack = Stack()
        let dic: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
        for c in s {
            if c == "(" || c == "[" || c == "{" {
                guard let c = dic[c] else { return false }
                stack.push(c)
            } else if stack.isEmpty() || stack.pop() != c {
                return false
            }
        }
        return stack.isEmpty()
    }
    
    func test() {
        print(isValid("()"))
        print(isValid("()[]{}"))
        print(isValid("(]"))
        print(isValid("([)]"))
        print(isValid("{[]}"))
    }
}

let solution = Solution()
solution.test()
