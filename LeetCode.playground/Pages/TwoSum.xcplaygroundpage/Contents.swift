//: [Previous](@previous)

import Foundation

/*Q1- Given an array of integers, return the indices of the two numbers that add up to a given target
 */
//arr[4] + arr[5] = arr[10]

//Fixed Pointer Technique
func findIndexToAddUptoTarget(_ nums: [Int], _ target: Int) -> [Int] {
    var retval:[Int] = []
    for (p1, _) in nums.enumerated() {
        var p2 = p1 + 1
        while (p2 < nums.count) {
            let actual = nums[p1] + nums[p2]
            print("indexs - \(p1) \(p2) ")
            if actual == target {
                retval.append(p1)
                retval.append(p2)
                return retval
            }
            p2 += 1
        }
    }
    return retval
}



//1. Best Case
//print(findIndexToAddUptoTarget([1,3,7,9,2], 11))
//2. Empty Erray
//print(findIndexToAddUptoTarget([], 11))
//3. One Element equal to target
//print(findIndexToAddUptoTarget([11] , 11))
//4. One Element not equal to target
//print(findIndexToAddUptoTarget([10], 11))
//5. Two sumation
//print(findIndexToAddUptoTarget([1,4,7,9,2], 11))
//6. Two numers
//print(findIndexToAddUptoTarget([3,3], 6))
//[key - value]
//[value - index]
//[valueNeeded - indexNeeded]
//CurrentValue
//[4,3,7,9,2]
//ValueNeeded Map - [7 - 0,8 - 1,4 - 2,2 - 3,9 - 4]
func optimisedSumOfTwoNumbers(_ nums: [Int], _ target: Int) -> [Int] {
    var retval:[Int] = []
    var valueNeedMap:[Int:Int] = [:]
    for (currentIndex, currentVal) in nums.enumerated() {
        let valueNeeded = target - currentVal
        let indexNeeded = valueNeedMap[currentVal]
        if let indexNeeded = indexNeeded {
            retval.append(indexNeeded)
            retval.append(currentIndex)
            return retval
        }
        valueNeedMap[valueNeeded] = currentIndex
    }
    return retval
}

print(optimisedSumOfTwoNumbers([4,3,7,9,2],11))
print(optimisedSumOfTwoNumbers([3,3],6))
print(optimisedSumOfTwoNumbers([], 11))
print(optimisedSumOfTwoNumbers([11], 11))

