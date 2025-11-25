//
//  BookService.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

enum APIError : Error {
    case invalidURL
    case decodingError
    case requestFailed
}

struct BookService {
    static func getAllBooks(completion: @escaping (Result<[BookCatalog], APIError>) -> Void){
        print("getAllBooks called")
        guard let url = URL(string:"https://api.potterdb.com/v1/books") else {
            print("failed to getAllBooks")
            completion(.failure(.invalidURL))
            return
        }
        print("test")
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error {
                print("failed service request")
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                print("failed service request data")
                completion(.failure(.requestFailed))
                return
            }
            
            do{
                print("get response here")
                let response = try JSONDecoder().decode(BookCatalog.self, from: data)
                completion(.success(response.data))
            } catch {
                print("failed decoding response")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
