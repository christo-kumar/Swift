import UIKit

var greeting = "Welcome to Properties"



//=============== Stored Property ====================
//Initialised immediatly
//Always process logic and takes time even after getting initialised

struct Exam1 {
    //stored prop-1
    var standard: String
    //stored prop-2
    var questions: [String] {
        sleep(5)
        return ["Stored","Properties"]
    }
}

let exam1 = Exam1(standard: "Class - 1")
print(exam1.questions)

//=============== Lazy Stored Property ================
//Initialised only when used
//Once initialised returns value instantly

struct Exam2 {
    //only be initialised within Exam2
    lazy private(set) var questions: [String] = {
        sleep(5)
        return ["Lazy","Stored","Properties"]
    }()
}

//instance needs to be var since its mutable
var exam2 = Exam2()
print(exam2.questions)

//=============== Computed Property ================
//Value is created on the basis of other properties

struct Account {
    let deposit: Int
    let loan: Int
    
    //Computed Property
    var balance: Int {
        return deposit - loan
    }
}

//=============== Property Observer ================
//NOTE: Only called on setting the property not on initialiser

struct Website {
    
    var url: String {
    
        didSet {
            url = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? url
        }
    }
}

//didSet will NOT get called here
var website = Website(url: "")
website.url = "https://www.google.com/param=lord of the ring"
print(website.url)

//Strong - Assignment and Increament in reference count
//Weak - Assignment and NO increament in reference count, can hold nil as well
//Unowned - Assignment and NO increament in reference count, cannot hold nil







