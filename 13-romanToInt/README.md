### [13. 罗马数字转整数](https://leetcode-cn.com/problems/roman-to-integer/submissions/)

```
罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

 示例 1:

 输入: "III"
 输出: 3

 示例 2:
 输入: "IV"
 输出: 4

 示例 3:
 输入: "IX"
 输出: 9

 示例 4:
 输入: "LVIII"
 输出: 58
 解释: L = 50, V= 5, III = 3.

 示例 5:
 输入: "MCMXCIV"
 输出: 1994
 解释: M = 1000, CM = 900, XC = 90, IV = 4.
```

方法：建一个罗马字符到数值的哈希表，通过遍历输入参数 String 的 Characer，再相加到返回值中

 为了处理特殊情况：小的数字在大的数字左边时，用大的数字减去小的数字，

 可以把 Characers 反转过来，再遍历，当 Characer 小于之前的 Characer，则减去自身，否则增加自身。

 此外，还需要处理负数和 0 两种特殊情况（第一位为0时，只有是0才满足回文数条件）

 时间复杂度：o(n)

 空间复杂度：o(n)

```swift
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

class Solution {
    func romanToInt(_ s: String) -> Int {
        let dic: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let rs = String(s.reversed())
        var result: Int = 0
        for i in 0..<rs.count {
            guard let current = dic[rs[i]] else { return result }
            if i > 0 && current < dic[rs[i-1]]! {
                result -= current
            } else {
                result += current
            }
        }
        return result
    }

    func test() {
        print(romanToInt("IV"))
    }
}

let solution = Solution()
solution.test()
```

