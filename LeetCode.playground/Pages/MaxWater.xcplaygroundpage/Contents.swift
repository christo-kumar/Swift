//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//Two Pointer Techique
func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    var p1 = 0
    var p2 = height.count - 1
    for (_,_) in height.enumerated() {
        if (p2 > p1) {
            let breadth = p2 - p1
            var lenght = 0
            if height[p1] < height[p2] {
                lenght = height[p1]
                p1 = p1 + 1
            } else {
                lenght = height[p2]
                p2 = p2 - 1
            }
            let currentArea = lenght * breadth
            if currentArea > maxArea {
                maxArea = currentArea
            }
        }
    }
    return maxArea
}

print(maxArea([1,1]))
