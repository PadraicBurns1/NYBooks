//
//  NetworkResponse.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/8/22.
//

import Foundation

public struct NetworkData: Decodable {
    
    let results: Results
    
}

public struct Results: Decodable {
    
    let books: [Book]
    
}
