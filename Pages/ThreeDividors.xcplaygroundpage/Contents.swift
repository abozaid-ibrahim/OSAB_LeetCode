//: [Previous](@previous)

import Foundation
func isPowerOfThree(_ n: Int) -> Bool {
    var n = log10(Double(n)) / log10(Double(3))
    return n.truncatingRemainder(dividingBy: 1.0) == 0
}


 func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil{
            return false
        }
        var slow = head
        var fast = head?.next?.next
        while fast != nil{
            if slow?.val == fast?.val{
               return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}
//https://leetcode.com/problems/intersection-of-two-linked-lists

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var acount = count(headA)
        var bcount = count(headB)
      
          var b = headB
          var a = headA
       if acount < bcount{
           var skip = bcount - acount
           while skip > 0{
                b = b?.next
               skip -= 1
           }
       }else{
        var skip = acount - bcount
           while skip > 0{
               a = a?.next
               skip -= 1
           }
       }
        
       while a != nil  {
        if a === b{
            return a
        }
         a = a?.next
         b = b?.next
       }
        
        
        return nil
    }
    func count(_ node:ListNode?)->Int{
        if node == nil {
            return 0
        }
        
        var cnt = 0
        var root = node
        while root != nil{
            cnt += 1
            root = root?.next
        }
        return cnt
    }
}

  
