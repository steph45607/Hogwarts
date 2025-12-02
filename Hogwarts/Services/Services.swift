//
//  Services.swift
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

struct Services {
    
    static func getAllBooks(completion: @escaping (Result<[BookResponse], APIError>) -> Void){
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
                print("failed decoding response \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    static func getAllChapters(bookId: String, completion: @escaping (Result<[ChapterResponse], APIError>) -> Void){
        print("getAllChapters called")
        print("SERVICE ", bookId)
        guard let url = URL(string:"https://api.potterdb.com/v1/books/\(bookId)/chapters") else {
            print("failed to getAllChapters")
            completion(.failure(.invalidURL))
            return
        }
        print(url)
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
                let response = try JSONDecoder().decode(ChapterList.self, from: data)
                completion(.success(response.data))
            } catch {
                print("failed decoding response \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
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
    
    static func getCharactersPage(page: Int, asc: Bool ,completion: @escaping (Result<CharacterCatalog, APIError>) -> Void){
        print("getAllMovies called")
        let urlString = "https://api.potterdb.com/v1/characters?page[number]=\(page)&&\(asc ? "sort=name":"sort=-name")"
        guard let url = URL(string: urlString) else {
            print("failed to getAllMovies")
            completion(.failure(.invalidURL))
            return
        }
//        print("test")
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
                completion(.success(response))
            } catch {
                print("failed decoding response \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    static func getAllPotions(completion: @escaping (Result<[PotionResponse], APIError>) -> Void){
        print("getAllPotions called")
        guard let url = URL(string:"https://api.potterdb.com/v1/potions") else {
            print("failed to getAllPotions")
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
                let response = try JSONDecoder().decode(PotionCatalog.self, from: data)
                completion(.success(response.data))
            } catch {
                print("failed decoding response \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    static func getAllSpells(completion: @escaping (Result<[SpellResponse], APIError>) -> Void){
        print("getAllSpells called")
        guard let url = URL(string:"https://api.potterdb.com/v1/spells") else {
            print("failed to getAllSpells")
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
                let response = try JSONDecoder().decode(SpellCatalog.self, from: data)
                completion(.success(response.data))
            } catch {
                print("failed decoding response \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}
