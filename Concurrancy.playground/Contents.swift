
import UIKit

var greeting = "Hello To Concurrancy"

//Example-1 Using Closures
enum NetworkError: Error {
    case badUrl
    case decodingError
    case badRequest
    case noData
    case custom(Error)
}
struct Post: Decodable {
    let title: String
    let body: String
}

func getPost(completion: @escaping (Result<[Post], NetworkError>)->Void) {
    guard let url = URL(string: "https://xyz.....") else {
        completion(.failure(.badUrl))
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(.custom(error)))
        } else if ((response as? HTTPURLResponse)?.statusCode != 200) {
            completion(.failure(.badRequest))
        } else {
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let posts = try? JSONDecoder().decode([Post].self, from: data)
            if let posts = posts {
                completion(.success(posts))
            } else {
                completion(.failure(.decodingError))
            }
        }
    }.resume()
}

getPost { result in
    switch result {
    case .success(let posts):
        print(posts)
    case .failure(let error):
        print(error)
    }
}

//Example-2 Using Async Await
func getPost1() async -> Result<[Post], NetworkError> {
    guard let url = URL(string: "https://xyz.....") else {
        return .failure(.badUrl)
    }
    do {
        let (data, _) =  try await  URLSession.shared.data(from: url)
        let posts = try? JSONDecoder().decode([Post].self, from: data)
        if let posts = posts {
            return .success(posts)
        } else {
           return .failure(.decodingError)
        }
    } catch {
        return.failure(.badRequest)
    }
}

Task.init() {
    let result = await getPost1()
    switch result {
    case .success(let posts):
        print(posts)
    case .failure(let error):
        print(error)
    }
}
