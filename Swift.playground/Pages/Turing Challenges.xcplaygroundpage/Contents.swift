//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func calPoints(_ ops: [String]) -> Int {
    var intArray:[Int] = []
    
    for chr in ops {
        let currentIndex = intArray.count - 1
        let prevIndex = intArray.count - 2
        if chr == "D" {
            print("Double Score the previous score")
            if currentIndex >= 0 {
                let newVal = intArray[currentIndex] * 2
                intArray.append(newVal)
            }
        } else if chr == "+" {
            print("Add previous 2 scores")
            if prevIndex >= 0 {
                let newVal = intArray[prevIndex] + intArray[currentIndex]
                intArray.append(newVal)
            }
        } else if chr == "C" {
            print("Invalidate previous scores")
            if currentIndex > 0 {
                intArray.remove(at: currentIndex)
            }
        } else {
            intArray.append(Int(chr) ?? 0)
        }
    }
    var sum = 0
    for num in intArray {
        sum = sum + num
    }
    return sum
}

print(calPoints(["5","2","C","D","+"]))


