//
//  BookViewModel.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation
import Combine

class BookViewModel: ObservableObject{
    @Published var book : Book?
    @Published var errorMessage: String?
    @Published var bookCatalog: [Book]? = []
    
    func loadAllBooks(){
        BookService.getAllBooks{ [weak self] result in
            DispatchQueue.main.async{
                print("dispatch getAllBooks")
                switch result{
                case .success(let bookCatalog):
                    print("success vm load one")
                    self?.bookCatalog = bookCatalog
                    
                case .failure(let error):
                    print("failure vm load one")
                    self?.errorMessage = self?.mapError(error)
                }
            }
            
        }
    }
    
    private func mapError(_ error: APIError) -> String {
        switch error{
        case .invalidURL:
            print("invalid")
            return "Invalid URL"
        case .requestFailed:
            print("request")
            return "Request Failed"
        case .decodingError:
            print("decoding")
            return "Decoding failed"
        }
    }
}
