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
    let author: String
    let cover: String
    let dedication: String
    let pages: Int
    let release_date : String
    let summary: String
    let title: String
    let wiki: String
}

struct ChapterList: Codable{
    let data : [ChapterResponse]
}

struct ChapterResponse: Identifiable, Codable{
    let id: String
    let attributes: Chapter
}
//
struct Chapter : Codable{
    let order : Int
    let slug : String
    let summary : String?
}
