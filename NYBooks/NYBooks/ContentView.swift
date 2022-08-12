//
//  ContentView.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ListView(viewModel: ListViewModel(network: NetworkManager()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
