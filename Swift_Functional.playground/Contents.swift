import UIKit



//Closers

//1. Trailing Closures
func loadPicture(url: String, completion: (String) -> Void) {
    completion(url)
}

loadPicture(url: "Some-URL") { retval in
}

//2. Escaping Closures
func loadMovie(movieURL: String, completion: @escaping (String)->Void) {
    //some async task
    completion("task completed")
}

loadPicture(url: "some url") { retval in
    print(retval)
}

//Functional Programming
var randomArray: [Int] = [4,3,8,9,11]

//1. Sorted
var sortedArray = randomArray.sorted { val1, val2 in
    return val1 > val2
}
print(sortedArray)

//2. Map
var doubledArray = randomArray.map { valueAtIndex in
    return valueAtIndex * 2
}
print(doubledArray)

//3. Filter
var filteredArray = randomArray.filter { valueAtIndex in
    return valueAtIndex > 5
}
print(filteredArray)

//4. Reduce - Multiply or add all the elements

var combinedAsString = randomArray.reduce("") {(result, a) -> String in
    return result + String(a)
}

print(combinedAsString)
var allAdded = randomArray.reduce(0,+)
print(allAdded)

/**FUNCTION TYPES**/

//1. Basic Example
var basicArthematic: (Int, Int) -> Int

func addTwoNumber(_ a: Int, _ b: Int)  -> Int {
    return a + b
}

func multiply(_ a: Int, _ b: Int)  -> Int {
    return a * b
}

basicArthematic = addTwoNumber
print(basicArthematic(1,2))

//2. Function type as Parameter
func wrapperFunction(param : (Int, Int) -> Int) {
    print(param(1,2))
}
wrapperFunction(param: multiply)

//3. Function Type as Return Type
func whichFunction(isAdd : Bool = false) -> (Int, Int) -> Int {
    return isAdd ? addTwoNumber : multiply
}

print(whichFunction()(2,2))

/** FUNCTIONS **/

//1. Simple Function
func winterFell(lord: String,_ lady: String = "Cat Stark") -> String {
    return "This is winterfell of \(lord) and \(lady)"
}
print(winterFell(lord: "Ned Stark", "Catherine"))
print(winterFell(lord: "Ned Stark"))

//2. Returning multiple values
func starkSiblings()->(eldest:String, middle:String, youngest: String ) {
    return ("Rob", "Arya", "Rickon")
}
var retval = starkSiblings()
print("\(retval.eldest) \(retval.middle) \(retval.youngest)")

//3. Variadic parameters
func lannisterFamily(lannisters: String ...) {
    for lannister in lannisters {
        print(lannister)
    }
}

lannisterFamily(lannisters: "Cersie", "Jammie", "Tyrion")

//4. Passing as a Reference
func addBustardSurname(first: inout String, second: inout String) {
    first = first + " Snow"
    second = second + " White"
}

var first = "Jon", second = "Ramsey"
addBustardSurname(first: &first, second: &second)
print("\(first) \(second)")


//Classes and Struct
class VideoMode {
    var name: String
    
    init(name: String) {
        self.name = name
        
    }
}

struct AudioMode {
    var name: String
}
