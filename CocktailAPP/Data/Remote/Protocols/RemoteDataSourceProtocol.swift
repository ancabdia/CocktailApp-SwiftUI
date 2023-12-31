//
//  RemoteDataSourceProtocol.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation
protocol RemoteCocktailDataSourceProtocol {
    func getRandomCocktail() async throws -> RemoteCocktail
    func getCocktailsByName(cocktailName name: String) async throws -> [RemoteCocktail]?
}
