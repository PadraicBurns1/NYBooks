//
//  Book.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/8/22.
//

import Foundation

public struct Book: Decodable {
    
    let rank: Int
    let rank_last_week: Int
    let weeks_on_list: Int
    let primary_isbn10: String
    let publisher: String
    let author: String
    let book_image: String
    let title: String
    let description: String
    
    init(rank: Int,
         rank_last_week: Int,
         weeks_on_list: Int,
         primary_isbn10: String,
         publisher: String,
         author: String,
         book_image: String,
         title: String,
         description: String) {
        self.rank = rank
        self.rank_last_week = rank_last_week
        self.weeks_on_list = weeks_on_list
        self.primary_isbn10 = primary_isbn10
        self.publisher = publisher
        self.author = author
        self.book_image = book_image
        self.title = title
        self.description = description
    }
    
    static func getMock() -> Book {
        return Book(rank: 1, rank_last_week: 1, weeks_on_list: 3, primary_isbn10: "0000000000", publisher: "ABC Publishing", author: "John Doe", book_image: "", title: "Book Title", description: "Book Description")
    }
    
}
