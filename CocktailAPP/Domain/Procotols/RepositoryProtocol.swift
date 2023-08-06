//
//  RepositoryProtocol.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation
protocol RepositoryProtocol {
    func getRandomCocktail() async throws -> Cocktail
//    func filterByName(cocktailName name: String) async throws -> [Cocktail]?
//    func getCocktailDetailById(idCocktail id: String) async throws-> Cocktail
}
