/**
给定一个正整数，返回它在 Excel 表中相对应的列名称。

例如，

1 -> A
2 -> B
3 -> C
...
26 -> Z
27 -> AA
28 -> AB 
...
示例 1:

输入: 1
输出: "A"
示例 2:

输入: 28
输出: "AB"
示例 3:

输入: 701
输出: "ZY"
 
思路：10进制转26进制
 
时间复杂度：O(n)
空间复杂度：O(1)
 */

import Foundation

class Solution {
    func titleToNumber(_ s: String) -> Int {
        var res = 0
        let scalarsOfA = "A".unicodeScalars        
        for char in Array(s) {
            let count = countBetween(char: char, scalarsOfA: scalarsOfA)
            res = res * 26 + count
        }        
        return res
    }
    
    func countBetween(char: Character, scalarsOfA: String.UnicodeScalarView) -> Int {
        let scalars = String(char).unicodeScalars
        return Int(scalars[scalars.startIndex].value - scalarsOfA[scalarsOfA.startIndex].value) + 1
    }
}
