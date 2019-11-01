/**

 */

import Foundation

// MARK: - String extension
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

/// ListNode
class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    func append(value: Int) {
        let node = ListNode(value)
        if let nextNode = next {
            nextNode.append(value: value)
        } else {
            next = node
        }
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        var text = "["
        var node: ListNode? = self
        while node != nil {
            text += "\(node!.val)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

/// TreeNode
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
