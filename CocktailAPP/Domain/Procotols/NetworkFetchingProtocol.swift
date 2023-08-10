//
//  NetworkFetchingProtocol.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 10/8/23.
//

import Foundation
import Combine
protocol NetworkFetchingProtocol {

    func load(fromRequest request: URLRequest) -> AnyPublisher<Data, Error>
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
}
