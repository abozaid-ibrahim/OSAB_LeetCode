//: [Previous](@previous)

import Foundation

func isValid(_ s: String) -> Bool {
    if s.isEmpty { return true }
    var stack = Stack<String.Element>()
    for x in s {
        switch x {
        case "(":
            stack.push(x)
        case ")":
            if stack.top == "(" {
                stack.pop()
            } else {
                stack.push(x)
            }
        case "{":
            stack.push(x)
        case "}":
            if stack.top == "{" {
                stack.pop()
            } else {
                stack.push(x)
            }
        case "[":
            stack.push(x)
        case "]":
            if stack.top == "[" {
                stack.pop()
            } else {
                stack.push(x)
            }
        default:
            return false
        }
    }
    return stack.isEmpty
}

isValid("()()")
