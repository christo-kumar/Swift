import UIKit

var greeting = "Returning SOME concrete element"

protocol Product {
    associatedtype Code
    func description() -> String
}

struct Laptop: Product {
    typealias Code = String
    func description() -> String {
        return "Laptop"
    }
}

struct Keyboard: Product {
    typealias Code = Int
    func description() -> String {
        return "Keyboard"
    }
}

struct Factory {
    //Returning some concrete instance of product
    func makeProduct() -> some Product {
        return Laptop()
    }
}
