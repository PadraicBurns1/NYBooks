//
//  NetworkManager.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/8/22.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case invalidStatusCode
}


protocol NetworkFetcher {
    func getModel<T: Decodable>(url: URL?) -> AnyPublisher<T, Error>
}

public class NetworkManager: NetworkFetcher {
    
    let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
}

extension NetworkManager {
    
    func getModel<T: Decodable>(url: URL?) -> AnyPublisher<T, Error> {

        guard let url = url else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        return self.session.dataTaskPublisher(for: url)
            .tryMap { map in
                return map.data
            }.decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                return error
            }.eraseToAnyPublisher()
    }
    
}

