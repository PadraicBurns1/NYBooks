//
//  DetailView.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/9/22.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Divider()
            LazyVGrid(
                columns: columns,
                alignment: .leading,
                spacing: 10,
                pinnedViews: [],
                content: {
                    Group {
                        Text("Title:")
                        Text(viewModel.book.title)
                        Text("Author:")
                        Text(viewModel.book.author)
                        Text("Publisher:")
                        Text(viewModel.book.publisher)
                        Text("ISBN:")
                        Text(viewModel.book.primary_isbn10)
                        Text("Rank:")
                        Text("\(viewModel.book.rank)")
                    }
                    Group {
                        Text("Rank Last Week:")
                        Text("\(viewModel.book.rank_last_week)")
                        Text("Weeks On List:")
                        Text("\(viewModel.book.weeks_on_list)")
                    }
                    
                })
                .padding()
            Divider()
            Text("\(viewModel.book.description)")
                .padding()
            Divider()
            Spacer()
            if !viewModel.book.book_image.isEmpty {
                HStack {
                    Spacer()
                    ImageView(withURL: viewModel.book.book_image)
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationBarTitle(Text("\(viewModel.book.title)"), displayMode: .inline)
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 350, height: 350)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(book: Book.getMock()))
    }
}
