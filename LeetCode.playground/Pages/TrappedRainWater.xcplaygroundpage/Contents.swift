//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func trap(_ height: [Int]) -> Int {
    var totalRain = 0
    let breadth = 1
    for (p1, _) in height.enumerated() {
        let minVal = findMaxLeft(p1, height) < findMaxRight(p1, height) ? findMaxLeft(p1, height) : findMaxRight(p1, height)
        let waterAtp1 = (minVal * breadth) - height[p1]
        totalRain += waterAtp1
    }
    return totalRain
}

func findMaxLeft(_ index: Int, _ height: [Int]) -> Int {
    var retVal = 0
    if index == 0 {
        retVal = 0
    }
    for leftI in stride(from: index, through: 0, by: -1) {
        retVal = height[leftI] > retVal ? height[leftI] : retVal
    }
    return retVal
}

func findMaxRight(_ index: Int, _ height: [Int]) -> Int {
    var retVal = 0
    if index == 0 {
        retVal = 0
    }
    for rightI in index..<height.count {
        retVal = height[rightI] > retVal ? height[rightI] : retVal
    }
    
    return retVal
}

func trapOpt(_ height: [Int]) -> Int {

    var p1 = -1
    var p2 = -1
    var maxArea = 0
    for (index, _) in height.enumerated() {
        let startValue = height[index]
        let endIndex = (height.count - index) - 1
        let endValue = height[endIndex]
        
        if p1 < 0 {
            if startValue > 0 {
                p1 = index
            }
        }
        
        if p2 < 0 {
            if endValue > 0 {
                p2 = endIndex
            }
        }
        
        //print("Current Index - \(index) p1=\(p1) p2=\(p2)")
        
        if p1 >= 0 && p2 >= 0 && index < p2 {
            
            if maxArea == 0 {
                maxArea = min(height[p1],height[p2]) * ((p2 - p1) - 1)
                //print("maxArea - \(maxArea)")
            } else {
                //After calculation of maxArea find
                //if value at next index is smaller than min
                let currentValue = height[index]
                if currentValue <= min(height[p1], height[p2]) {
                    maxArea = maxArea - currentValue
                   
                } else if currentValue > min(height[p1], height[p2]) {
                    //if value at next index is greater than min p1, p2
                    //subtract current height from max Area
                    //print("At Index - \(index)")
                    maxArea = maxArea - min(height[p1], height[p2])
                    var lenght = 0
                    var minValue = 0
                    if height[p1] <= height[p2] {
                        //p2 is higher in between p1 and p2
                        lenght = (p2 - index) - 1
                        minValue = min(height[index], height[p2])
                    } else {
                        //p1 is higher in between p1 and p2
                        lenght = (index - p1) - 1
                        minValue = min(height[index], height[p1])
                    }
                    
                    let deltaValue = minValue - min(height[p1], height[p2])
                    let deltaArea = deltaValue * lenght
                    maxArea = maxArea + deltaArea
                }
                print("at index - \(index) - maxArea - \(maxArea)")
            }
        }
    }
    return maxArea
}

//(trap([4,2,0,3,2,5]))
//print(trapOpt([4,2,0,3,2,5]))
    //..print(trapOpt([0,1,0,2,1,0,1,3,2,1,2,1]))

func trapOpt2(_ height: [Int]) -> Int {
    var maxLeft = 0
    var maxRigth = 0
    var PL = 0
    var PR = height.count - 1
    var index = 0
    var totalArea = 0
    while (index <= height.count - 1) {
        if height[PL] <= height[PR] {
            //operate on left
            if height[PL] < maxLeft {
                //calculate Area
                let currentArea = maxLeft - height[PL]
                totalArea = totalArea + currentArea
            } else {
                maxLeft = height[PL]
            }
            
            PL += 1
        } else {
            //operate on right
            if height[PR] < maxRigth {
                //calculate Area
                let currentArea = maxRigth - height[PR]
                totalArea = totalArea + currentArea
            } else {
                maxRigth = height[PR]
            }
            PR -= 1
        }
        index += 1
    }
    
    return totalArea
}

print(trapOpt2([0,1,0,2,1,0,1,3,2,1,2,1]))








