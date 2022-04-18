//: [Previous](@previous)

import Foundation
import Darwin
import UIKit

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
        print(error)
    }
    
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if (data != nil && data?.count != 0) {
            let response = String(data: data!, encoding: .utf8)
            print(response!)
        }
    }
    
    task.resume()
}

struct ResponseData: Decodable {
    let firstName: String
    enum CodingKeys: String, CodingKey {
        case firstName = "First_Name"
    }
}

struct RequestData: Encodable {
    let firstName: String
    enum CodingKeys: String, CodingKey {
        case firstName = "First_Name"
    }
}

func decodePostData(firstName: String) {
    
    guard let serviceUrl = URL(string: "https://url.com") else {
        return
    }
    
    let requesData = RequestData(firstName: firstName)
    let requestBody = try? JSONEncoder().encode(requesData)
    
    var urlRequest = URLRequest(url: serviceUrl)
    urlRequest.httpMethod = "post"
    urlRequest.httpBody = requestBody
    urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
    
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if (data != nil && data?.count != 0) {
            try? JSONDecoder().decode(ResponseData.self, from: data!)
        }
    }
    
    task.resume()
    
}

func genericAPI<U:Encodable,T:Decodable>(param1: U, param2: T) {
    
}

decodePostData(firstName: "Christo")


//2. Download Task
class ImageDownloader : NSObject {
    
    var downloadTask: URLSessionDownloadTask?
    var resumeData: Data?
    var urlSession: URLSession?
    
    func downloadImage() {
        let urlString = "https://www.animalKingdomaz.com/image/1"
        guard let url = URL(string:urlString) else {
            return
        }
        urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        downloadTask = urlSession?.downloadTask(with: url)
        downloadTask?.resume()
    }
    
    func onCancel() {
        downloadTask?.cancel(byProducingResumeData: {[weak self] resumeData in
            guard let rData = resumeData else {
                return
            }
            self?.resumeData = rData
        })
    }
    
    func onResume() {
        guard let resumeData = self.resumeData else {
            // inform the user the download can't be resumed
            return
        }
        let downloadTask = self.urlSession?.downloadTask(withResumeData: resumeData)
        downloadTask?.resume()
        self.downloadTask = downloadTask
    }
}


extension ImageDownloader: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            let image = UIImage(data: data)
            print(image as Any)
        }
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = totalBytesWritten / totalBytesExpectedToWrite * 100
        DispatchQueue.main.async { [weak self] in
            print(progress)
        }
    }
    
        func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
            guard let error = error else {
                    // Handle success case.
                    return
                }
                let userInfo = (error as NSError).userInfo
                if let resumeData = userInfo[NSURLSessionDownloadTaskResumeData] as? Data {
                    self.resumeData = resumeData
                }
        }
}
