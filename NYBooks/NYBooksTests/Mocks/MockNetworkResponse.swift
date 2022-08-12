//
//  MockNetworkResponse.swift
//  NYBooksTests
//
//  Created by Padraic Burns on 8/11/22.
//

import Foundation
@testable import NYBooks

extension NetworkData {
    
    static func getMock() -> NetworkData {
        return NetworkData(results: Results(books: [Book.getMock()]))
    }
    
}
