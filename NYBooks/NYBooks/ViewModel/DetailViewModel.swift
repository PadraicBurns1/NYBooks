//
//  DetailViewModel.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/9/22.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
}
