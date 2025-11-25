//
//  Character.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

struct CharacterCatalog: Codable{
    let data : [CharacterResponse]
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
