//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
struct Movie {
    var title: String
    var genre: String
    var views: Int
}

func updateMovie(_ movie: inout Movie) {
    movie.title = "someOther"
    movie.genre = "Kids"
    movie.views = 10
}

var movie = Movie(title: "", genre: "", views: 0)
updateMovie(&movie)
print(movie)

//CLOSURES
//function type as param
func closureDemo1(param: (Int) -> String ) {
    print(param(1))
}

closureDemo1 { number in
    return "Hello - \(number)"
}

//function type as return type
func someFunction(number: Int) -> String {
    return "Hello - \(number)"
}

func closureDemo2() -> (Int) -> String {
    return someFunction
}

print(closureDemo2()(1))

//Escaping closures
func getPosts(completion: @escaping (String) -> ()){
    //some processing
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completion("got Image")
    }
}

