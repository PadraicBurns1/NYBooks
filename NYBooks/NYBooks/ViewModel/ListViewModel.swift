//
//  BooksViewModel.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/8/22.
//

import Foundation
import Combine


class ListViewModel: ObservableObject {
    
    let network: NetworkFetcher
    var subs = Set<AnyCancellable>()
    @Published var books: [Book]?
    @Published var category: Category
    
    
    init(network: NetworkFetcher) {
        self.network = network
        self.category = .hardcoverFiction
    }
    
    func requestBooks() {
        self.network.getModel(url: URL(string: "https://api.nytimes.com/svc/books/v3/lists/current/\(category.getUrlParameter()).json?api-key=AZwPVULysRIvy1WovyFxgUyC9miUG7Ui"))
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { (networkData: NetworkData) in
                self.books = networkData.results.books
            }.store(in: &self.subs)

    }
    
}
