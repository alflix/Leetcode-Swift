/**
  https://leetcode-cn.com/problems/longest-palindromic-substring/

 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。

 示例 2：
 输入: "cbbd"
 输出: "bb"

 方法：
 使用暴力的枚举法的话，时间复杂度为O(n^3)，不是很好。较好的解法是中心拓展法。
 回文子串，从中心往左右两边延伸的话是对称的，利用这个特效，可以在循环中依次查找每个中心点，其往左右两边延伸最长的中心点。
 注意有偶数和奇数2种情况，其中心点不一样（偶数时有2个中心点），因此可以写成 lengthOfExpendCenter 的函数计算该值
 在循环中，获得该最大值

 复杂度分析
 时间复杂度：O(n^2)
 空间复杂度：O(n)//由于 Swift 数组的特殊性，需要转换为 [Character]，所以不是 O(1)
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 1 { return "" }
        let characters = Array(s)
        var start = 0, end = 0
        var index = 0
        while index < s.count {
            // 单数时，中心点
            let len1 = lengthOfExpendCenter(characters, left: index, right: index)
            // 双数时，中心点
            let len2 = lengthOfExpendCenter(characters, left: index, right: index + 1)
            let len = max(len1, len2)
            // 大于上一个值时，才更新 start 和 end
            if len > (end - start) {
                // 下面的逻辑，画个实例出来就知道为什么了
                start = index - (len-1)/2
                end = index + len/2
            }
            index += 1
        }
        return String(characters[start...end])
    }

    func lengthOfExpendCenter(_ characters: [Character], left: Int, right: Int) -> Int {
        var left = left, right = right
        while left >= 0 && right < characters.count && characters[left] == characters[right] {
            left -= 1
            right += 1
        }
        // 因为最后一个 while 循环多了 2，而实际上要 + 1，所以最后是 -1
        return right - left - 1
    }
}

let s = Solution()
let count = s.longestPalindrome("babad")
