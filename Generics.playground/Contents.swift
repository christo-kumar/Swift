import UIKit

var greeting = "Hello, playground"

class GenericList<T> {
    var list:[T] = []
    
    public func addElement(element: T) {
        list.append(element)
    }
    public func getElement(index: Int) -> T {
        return list[index]
    }
    
    public func demoGenericFunction <X>(param: X) -> X {
        return param
    }
    
    public func demoWildCard<X:Numeric>(param: Array<X>){
        for value in param {
            print(value)
        }
    }
}
