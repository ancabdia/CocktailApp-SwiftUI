//
//  NetworkFetchingProtocol.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 10/8/23.
//

import Foundation
protocol NetworkFetchingProtocol {
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
}
