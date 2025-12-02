//
//  Spell.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

struct SpellCatalog: Codable {
    let data: [SpellResponse]
}

struct SpellResponse: Identifiable, Codable {
    let id: String
    let attributes: Spell
}

struct Spell: Codable {
    let name: String
    let slug: String
    let incantation: String?
    let effect: String?
    let type: String?
    let light: String?
    let hand: String?
    let creator: String?
    let image: String?
    let wiki: String?
    let category: String?
}
