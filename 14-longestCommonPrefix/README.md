### [14. 最长公共前缀](https://leetcode-cn.com/problems/longest-common-prefix/)

```
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
```

方法：

 时间复杂度：o(s) s 是所有字符串中字符数量的总和

 空间复杂度：o(1)

```swift
import Foundation

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }

    func index(of find: String) -> Int? {
        return range(of: find)?.lowerBound.encodedOffset
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        if strs.count == 1 {
            return strs[0]
        }
        var result = strs[0]
        for str in strs[1...strs.count-1] {
            while str.index(of: result) != 0 {
                if result.count <= 1 {
                    return ""
                }
                result = result[0..<result.count-1]
            }
        }
        return result
    }

    func test() {
        print(longestCommonPrefix(["flower","flow","flight"] ))
        print(longestCommonPrefix(["dog","racecar","car"]))
        print(longestCommonPrefix(["c","acc","ccc"]))
    }
}

let solution = Solution()
solution.test()
```

