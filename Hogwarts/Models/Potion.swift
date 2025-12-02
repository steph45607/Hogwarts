//
//  Potion.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

struct PotionCatalog: Codable {
    let data: [PotionResponse]
}

struct PotionResponse: Identifiable, Codable {
    let id: String
    let attributes: Potion
}

struct Potion: Codable {
    let name: String
    let slug: String
    let effect: String?
    let side_effects: String?
    let characteristics: String?
    let difficulty: String?
    let ingredients: String?
    let inventors: String?
    let manufacturers: String?
    let image: String?
    let wiki: String?
}
