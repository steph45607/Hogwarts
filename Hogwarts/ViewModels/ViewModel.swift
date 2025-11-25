//
//  MovieViewModel.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation
import Combine

class ViewModel: ObservableObject{
//    @Published var movie : Movie?
    @Published var errorMessage: String?
    @Published var movieCatalog: [MovieResponse]? = []
    @Published var characterCatalog: [CharacterResponse]? = []
    
    func loadAllMovies(){
        Services.getAllMovies{ [weak self] result in
            DispatchQueue.main.async{
                print("dispatch getAllMovies")
                switch result{
                case .success(let movieCatalog):
                    print("success vm load one")
                    self?.movieCatalog = movieCatalog
                    
                case .failure(let error):
                    print("failure vm load one")
                    self?.errorMessage = self?.mapError(error)
                }
            }
            
        }
    }
    
    func loadAllCharacters(asc: Bool){
        Services.getAllCharacters(asc : asc){ [weak self] result in
            DispatchQueue.main.async{
                print("dispatch getAllMovies")
                switch result{
                case .success(let characterCatalog):
                    print("success vm load one")
                    self?.characterCatalog = characterCatalog
                    
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
