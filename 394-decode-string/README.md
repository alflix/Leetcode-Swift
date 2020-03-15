### [394. 字符串解码](https://leetcode-cn.com/problems/decode-string/)

#### 题目

给定一个经过编码的字符串，返回它解码后的字符串。

编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。

你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。

此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。

示例:

s = "3[a]2[bc]", 返回 "aaabcbc".
s = "3[a2[c]]", 返回 "accaccacc".
s = "2[abc]3[cd]ef", 返回 "abcabccdcdcdef".

#### 思路

利用栈。
遍历字符串，遇到数字/字母，保存起来。
"]"对应的是出栈的动作，因此"["是入栈。
出栈的时候，基于栈内的数据，拼接出字符串。

![](https://tva1.sinaimg.cn/large/00831rSTgy1gcuxa1ov2wj31260ta77f.jpg)

#### 复杂度

时间复杂度: O(n)

空间复杂度: O(n)

#### 解法

```swift
class Solution {
    func decodeString(_ s: String) -> String {
        var stack: [(Int, String)] = []
        var mutli: Int = 0
        var res: String = ""
        for c in Array(s) {
            switch c {
            case "[":
                stack.append((mutli, res))
                mutli = 0
                res = ""
            case "]":
                if let pop = stack.popLast() {
                    res = pop.1 + String(repeating: res, count: pop.0)
                }
            case "0"..."9":
                mutli = mutli * 10 + Int(String(c))!
            //"a"..."z"
            default:
                res += String(c)
            }
        }
        return res
    }
}
```