//
//  Services.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

struct Services {
    static func getAllMovies(completion: @escaping (Result<[MovieResponse], APIError>) -> Void){
        print("getAllMovies called")
        guard let url = URL(string:"https://api.potterdb.com/v1/movies") else {
            print("failed to getAllMovies")
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
                let response = try JSONDecoder().decode(MovieCatalog.self, from: data)
                completion(.success(response.data))
            } catch {
                print("failed decoding response \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    static func getAllCharacters(asc: Bool ,completion: @escaping (Result<[CharacterResponse], APIError>) -> Void){
        print("getAllMovies called")
        guard let url = URL(string: asc ?  "https://api.potterdb.com/v1/characters?sort=name": "https://api.potterdb.com/v1/characters?sort=-name") else {
            print("failed to getAllMovies")
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
                let response = try JSONDecoder().decode(CharacterCatalog.self, from: data)
                completion(.success(response.data))
            } catch {
                print("failed decoding response \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
