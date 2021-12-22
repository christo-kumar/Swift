import UIKit

var greeting = "Hello, playground"

//DispatchQueue.main.async {
//    for numer in 1...3{ print("North \(numer)")}
//}
//
//DispatchQueue.main.async {
//    for numer in 1...3{ print("South \(numer)")}
//}


func case1(){
        let india = DispatchQueue(label: "perform_task_india")
        let australia = DispatchQueue(label: "perform_task_australia")
        
    india.sync {
            for numer in 1...2{ print("India \(numer)")}
    }
    india.sync {
            for numer in 11...12{ print("India \(numer)")}
    }
    australia.sync {
        for numer in 1...2{ print("Australia \(numer)")}
    }
    australia.sync {
            for numer in 11...12{ print("Australia \(numer)")}
    }
}
    
//case1()

func case2(){
        let india = DispatchQueue(label: "perform_task_india")
        let australia = DispatchQueue(label: "perform_task_australia")
        
    india.async {
            for numer in 1...2{ print("India \(numer)")}
    }
    india.async {
            for numer in 11...12{ print("India \(numer)")}
    }
    australia.async {
        for numer in 1...2{ print("Australia \(numer)")}
    }
    australia.async {
            for numer in 11...12{ print("Australia \(numer)")}
    }
}

//case2()

func case3(){
    let india = DispatchQueue(label: "india", attributes: .concurrent)
    let australia = DispatchQueue(label: "australia", attributes: .concurrent)

    india.sync {
            for numer in 1...6{ print("India \(numer)")}
    }
    
    india.async {
            for numer in 11...16{ print("India \(numer)")}
    }
    
    australia.sync {
        for numer in 1...6{ print("Australia \(numer)")}
    }
    
    australia.async {
            for numer in 11...16{ print("Australia \(numer)")}
    }
}

case3()

func case4(){
    let india = DispatchQueue(label: "india", attributes: .concurrent)
    let australia = DispatchQueue(label: "australia", attributes: .concurrent)

    india.async {
            for numer in 1...2{ print("India \(numer)")}
    }
    
    india.async {
            for numer in 11...12{ print("India \(numer)")}
    }
    
    australia.async {
        for numer in 1...2{ print("Australia \(numer)")}
    }
    
    australia.async {
            for numer in 11...12{ print("Australia \(numer)")}
    }
}

//case4()
