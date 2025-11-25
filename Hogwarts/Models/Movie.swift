//
//  Movie.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

struct MovieCatalog: Codable{
    let data : [MovieResponse]
}

struct MovieResponse : Identifiable, Codable {
    let id: String
    let attributes : Movie
}

struct Movie : Codable {
        let box_office: String?
        let budget: String?
        let cinematographers: [String]?
        let directors: [String]?
        let distributors: [String]?
        let editors: [String]?
        let music_composers: [String]?
        let poster: String?
        let producers: [String]?
        let rating: String?
        let release_date: String?
        let running_time: String?
        let screenwriters: [String]?
        let summary: String?
        let title: String
        let trailer: String?
        let wiki: String?
}
