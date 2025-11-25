//
//  Book.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

struct BookCatalog: Codable{
    let data : [BookResponse]
}

struct BookResponse : Identifiable, Codable {
    let id: String
    let attributes : Book
}

struct Book : Codable {
    let name: String
//    let attributes :  Book
//    let cover: String
//    let dedication: String
//    let pages: Int
//    let release_date : String
//    let summary: String
//    let title: String
//    let wiki: String
}

struct ChapterResponse: Codable{
    let id: String
    let data: Chapter
}

struct Chapter : Codable{
    let order : Int
    let summary : String
}
