//
//  Character.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

struct CharacterCatalog: Codable{
    let data : [CharacterResponse]
    let meta : Pagination
    let links : Links
}
// so it can acess the page number, use Links since it has the same attributes
struct Pagination: Codable{
    let pagination: Page
}

struct Page: Codable{
    var current : Int
    let first : Int?
    let prev : Int?
    let next: Int?
    let last : Int?
    let records : Int
}

// to get the links for every case
struct Links: Codable{
    let current : String
    let first : String?
    let prev : String?
    let next: String?
    let last : String?
}

struct CharacterResponse : Identifiable, Codable {
    let id: String
    let attributes : Character
}

struct Character : Codable {
    let alias_names: [String]
    let animagus: String?
    let blood_status: String?
    let boggart: String?
    let born: String?
    let died: String?
    let eye_color: String?
    let family_members: [String]
    let gender: String?
    let hair_color: String?
    let height: String?
    let house: String?
    let image: String?
    let jobs: [String]
    let marital_status: String?
    let name: String
    let nationality: String?
    let patronus: String?
    let romances: [String]
    let skin_color: String?
    let species: String?
    let titles: [String]
    let wands: [String]
    let weight: String?
    let wiki: String
}
