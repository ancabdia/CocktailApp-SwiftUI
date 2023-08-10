//
//  URLSession.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 10/8/23.
//

import Foundation
import Combine

extension URLSession: NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: url)
    }
}
