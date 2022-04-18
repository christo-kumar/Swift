//: [Previous](@previous)

import Foundation
import UIKit


func someFunction() {
    let greeting = "Hello, playground"
    print(greeting)
}

//Main Queue
DispatchQueue.main.async {
    someFunction()
}
//Background Queue
DispatchQueue.global(qos: .background).async {
    someFunction()
}
//Concurrent Background Queue
let concurrent = DispatchQueue(label:"India", attributes: .concurrent)
concurrent.async {
    someFunction()
}

//Get Data Example
func updateUI() {}

func getData() {
    guard let url = URL(string: "") else {
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) {  data, response, error in
        guard data != nil else {
            return
        }
        
        DispatchQueue.main.async {
            updateUI()
        }
    }
    
    task.resume()
}

//Get data from multiple loacatiol
func getMultiData() {
    
    let urls = ["https://url1.com","https://url2.com"]
    
    let group = DispatchGroup()
    
    for urlStr in urls {
        
        group.enter()
        
        guard let url = URL(string: urlStr) else {
            continue
        }
        
        let task = URLSession.shared.dataTask(with: url) {  data, response, error in
            defer {
                group.leave()
            }
            guard data != nil else {
                return
            }
        }
        task.resume()
    }
    
    group.notify(queue: .main) {
        updateUI()
    }
}


