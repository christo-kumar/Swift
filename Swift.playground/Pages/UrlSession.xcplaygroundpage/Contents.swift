//: [Previous](@previous)

import Foundation
import Darwin

var greeting = "Hello, playground"

//1. Data Task
func getData() {
    
    let session = URLSession.shared
    guard let serviceURL = URL(string: "http://url.com") else {
        return
    }
    
    let task = session.dataTask(with: serviceURL) { /*[weak self]*/ data, response, error in
        let httpResponse = response as! HTTPURLResponse
        if (httpResponse.statusCode == 200){
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(jsonData!)
            let json = jsonData as! Dictionary<String,Any>
            print(json)
        } else {
            print(error.debugDescription)
        }
        
    }
    
    task.resume()
}

getData()

func postData(dataDict : Dictionary<String,Any>) {
    
    let session = URLSession.shared
    guard let serviceUrl = URL(string: "https://url.com") else {
        return
    }
    
    var urlRequest = URLRequest(url: serviceUrl)
    urlRequest.httpMethod = "post"

    do {
        let requestBody = try JSONSerialization.data(withJSONObject: dataDict, options: .prettyPrinted)
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
    } catch let error {
        
    }
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if (data != nil && data?.count != 0) {
            let response = String(data: data!, encoding: .utf8)
            print(response!)
        }
    }
            
}
