//: [Previous](@previous)

import Foundation

struct Movie {
    var title: String
    var genre: String
    var views: Int
}

struct Library {
    
    let movies = [Movie(title: "LOTR", genre: "Kids", views: 12), Movie(title: "ET", genre: "Fiction", views: 12)]
    private var _totalView = 0
    
    //COMPUTED PROPERTIES are called during initialisation
    var totalViews: Int {
        get {
            //return _totalView
            return movies.reduce(0) { value, movie in
                return value + movie.views
            }
        } set {
            _totalView = newValue
        }
        
    }
    
    lazy var totalViews2: Int =  {
        print("...LAZY PROPERTIES")
        return movies.reduce(0) { value, movie in
            return value + movie.views
        }
    }()
    
    //PROPERTY OBSERVER
    var downloadURL: String? {
        willSet {
            print("\(downloadURL ?? "NIL") - \(newValue ?? "")")
        }
        
        didSet {
            print("\(oldValue ?? "NIL") - \(downloadURL ?? "")")
        }
    }
    
    //Lazy PROPERTIES ~ values are not created till it is used first time
}

var lib = Library()
//print(lib.totalViews)
//print(lib.totalViews2)
lib.downloadURL = "XYZ"
print(lib.downloadURL!)
//lib.totalViews = "1"

struct TaylorFan {
    static var favSong = "Oops I do it again"
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "Christo", age: 0)
print(TaylorFan.favSong)


