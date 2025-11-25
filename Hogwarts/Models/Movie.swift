//
//  Movie.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

import Foundation

struct MovieCatalog: Codable{
    let data : [BookResponse]
}

struct MovieResponse : Identifiable, Codable {
    let id: String
    let attributes : Book
}

struct Movie : Codable {
    let author: String
    let cover: String
    let dedication: String
    let pages: Int
    let release_date : String
    let summary: String
    let title: String
    let wiki: String
}
