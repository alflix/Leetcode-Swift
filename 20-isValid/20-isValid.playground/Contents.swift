/**
 */
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
}

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 > 0 {
            return false
        }
        return true
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
