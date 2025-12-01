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
    @Published var potionCatalog: [PotionResponse]? = []
    @Published var spellCatalog: [SpellResponse]? = []
    @Published var characterCatalogPage :  Page = Page(current: 1, first: 1, prev: 0, next: 0, last: 0, records: 0)
//    @Published var characterCatalogLinks : Links = Links(current: "", first: "", prev: "", next: "", last: "")
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
                print("dispatch getAllCharacters")
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
    
    func loadPageCharacters(asc: Bool){
        Services.getCharactersPage(page: self.characterCatalogPage.current, asc : asc){ [weak self] result in
            DispatchQueue.main.async{
                print("dispatch getCharactersPage")
//                print(self?.characterCatalogLinks)
//                print(self?.characterCatalogPage)
                switch result{
                case .success(let characterCatalog):
                    print("success vm load one")
                    self?.characterCatalog = characterCatalog.data
                    self?.characterCatalogPage = characterCatalog.meta.pagination
                    
                case .failure(let error):
                    print("failure vm load one")
                    self?.errorMessage = self?.mapError(error)
                }
            }
            
        }
    }
    
    func nextPage(asc: Bool) {
        guard let next = characterCatalogPage.next else { return }
        characterCatalogPage.current = next
        loadPageCharacters(asc: asc)
    }

    func prevPage(asc: Bool) {
        guard let prev = characterCatalogPage.prev else { return }
        characterCatalogPage.current = prev
        loadPageCharacters(asc: asc)
    }

    func firstPage(asc: Bool) {
        characterCatalogPage.current = characterCatalogPage.first ?? 1
        loadPageCharacters(asc: asc)
    }

    func lastPage(asc: Bool) {
        characterCatalogPage.current = characterCatalogPage.last ?? 53
        loadPageCharacters(asc: asc)
    }

    
    func loadAllPotions(){
        Services.getAllPotions(){ [weak self] result in
            DispatchQueue.main.async{
                print("dispatch getAllMovies")
                switch result{
                case .success(let potionCatalog):
                    print("success vm load one")
                    self?.potionCatalog = potionCatalog
                    
                case .failure(let error):
                    print("failure vm load one")
                    self?.errorMessage = self?.mapError(error)
                }
            }
        }
    }
    
    func sortCurrentPage(asc: Bool) {
        guard var characters = characterCatalog else { return }
        
        characters.sort {
            if asc {
                $0.attributes.name < $1.attributes.name
            } else {
                $0.attributes.name > $1.attributes.name
            }
        }
        
        self.characterCatalog = characters
    }

    
    func loadAllSpells(){
        Services.getAllSpells(){ [weak self] result in
            DispatchQueue.main.async{
                print("dispatch getAllMovies")
                switch result{
                case .success(let spellCatalog):
                    print("success vm load one")
                    self?.spellCatalog = spellCatalog
                    
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
