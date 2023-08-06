//
//  RemoteDataSourceProtocol.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation
protocol RemoteCocktailDataSourceProtocol {
    func getRandomCocktail() async throws -> RemoteCocktail
//    func filterByName(cocktailName name: String) async throws -> [RemoteCocktail]?
//    func getCocktailDetailById(idCocktail id: String) async throws -> RemoteCocktail
}
