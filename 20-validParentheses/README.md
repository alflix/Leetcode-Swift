### [20. 有效的括号](https://leetcode-cn.com/problems/merge-two-sorted-lists/submissions/)

```
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
```

 方法：匹配问题，我们一般使用 栈
 遍历字符串，我们把左括号压入栈中，当遇到右括号，和栈顶元素比较！

 
 时间复杂度：O(n)
 空间复杂度：O(n)

```swift
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
```

