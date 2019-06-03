/**
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:
 输入: "()"
 输出: true

 示例 2:
 输入: "()[]{}"
 输出: true

 示例 3:
 输入: "(]"
 输出: false

 示例 4:
 输入: "([)]"
 输出: false

 示例 5:
 输入: "{[]}"
 输出: true
 */
import Foundation

struct Stack {
    fileprivate var array: [Character] = []

    mutating func push(_ element: Character) {
        array.append(element)
    }

    mutating func pop() -> Character? {
        return array.popLast()
    }

    func isEmpty() -> Bool {
        return array.count > 0
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 > 0 {
            return false
        }
        var stack = Stack()
        let dic: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
        for character in s {
            if character == "(" || character == "[" || character == "{" {
                stack.push(dic[character]!)
            } else if stack.isEmpty() || stack.pop() != character {
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
