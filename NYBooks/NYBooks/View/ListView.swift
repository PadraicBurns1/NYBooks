//
//  ListView.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/8/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Category", selection: $viewModel.category) {
                    ForEach(Category.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .onChange(of: viewModel.category) { tag in viewModel.requestBooks()
                }
                Spacer()
                List(viewModel.books ?? [], id: \.primary_isbn10) { book in
                    NavigationLink(destination: DetailView(viewModel: DetailViewModel(book: book))) {
                        Text(book.title)
                    }
                }
            }
            .navigationBarTitle(Text("NYT Bestsellers"), displayMode: .inline)
        }
        .onAppear {
            viewModel.requestBooks()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel(network: NetworkFetcher.self as! NetworkFetcher))
    }
}
