//
//  APIManager.swift
//  MS
//
//  Created by ManendraSingh on 08/01/23.
//

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler<T> = (Result<T, DataError>) -> Void

class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func request<T: Decodable> (
    modelType: T.Type,
    type: EndPointType,
    completion: @escaping Handler<T>
    ) {
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        // Background task
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(modelType, from: data)
                completion(.success(products))
            }catch {
                completion(.failure(.network(error)))
            }

        }.resume()
    }
}

//
//class Api : ObservableObject{
//    @Published var books = [Book]()
//
//    func loadData(completion:@escaping ([Book]) -> ()) {
//        guard let url = URL(string: "https://training.xcelvations.com/temp/books.json") else {
//            print("Invalid url...")
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data, error == nil else {
//                completion(.failure(.network(error)))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse,
//                  200 ... 299 ~= response.statusCode else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            do {
//                let products = try JSONDecoder().decode(Product, from: data)
//                completion(.success(products))
//            }catch {
//                completion(.failure(.network(error)))
//            }
//
//        }.resume()
//
//    }
//}
