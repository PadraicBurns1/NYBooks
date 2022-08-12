//
//  MockNetworkManager.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/9/22.
//

import Foundation
import Combine
@testable import NYBooks

public class MockNetworkManager: NetworkFetcher {
    
    let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
}

extension MockNetworkManager {
    
    public func getModel<T: Decodable>(url: URL?) -> AnyPublisher<T, Error> {
        return Just(NetworkData.getMock() as! T).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
}
