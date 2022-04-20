//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//public - Available to everyone
//internal - Available to your swift code i.e your classes not to extenal framework
//file private Available in same file
//private - Available in class + Extension

//default type = internal
public struct Person {
    public var firstName: String
    var middleName: String
    fileprivate var lastName: String
    private var age: Int?
    
    init() {
        firstName = ""
        lastName = ""
        middleName = ""
        age = 0
    }
}

var person = Person()
person.firstName = "Christo"
person.middleName = "Abhinav"
person.lastName = "Kumar" //can be used as its file private
//person.age = 19 as its private


