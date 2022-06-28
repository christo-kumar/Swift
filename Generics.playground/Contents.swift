import UIKit

var greeting = "Welcome to Generics Demo"
print(greeting)

///==================== Generic Function ======================================
func demoGenericFunction<X, Y>(_ param1: X, _ param2: Y) -> Y {
    return param2
}
demoGenericFunction(1, "Hello")

///==================== Generic Function Constraints =============================
//X can be of only Equatable type
func findIndex<X: Equatable>(list: [X], value:X) ->Int? {
    //As Only Equatables can be compared like this
    return list.firstIndex { param  in
        return param == value
    }
}
struct Student: Codable {
    
}

func serialiseToData<T: Codable> (_ value: T) {
    try? JSONEncoder().encode(value)
}

let student = Student()
serialiseToData(student)



///==================== Generic Class ==========================================
class GenericList<T> {
    var list:[T] = []
    
    public func addElement(_ element: T) {
        list.append(element)
    }
    public func getElement(index: Int) -> T {
        return list[index]
    }
}

let genercList = GenericList<String>()
genercList.addElement("Hello")



