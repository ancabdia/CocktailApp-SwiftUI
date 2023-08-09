//
//  RepositoryProtocol.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 6/8/23.
//

import Foundation
protocol RepositoryProtocol {
    //añadir funciones del repositoryImpl
    func addFavCocktail(cocktail: Cocktail)
    func removeFavCocktail(cocktail: Cocktail)
    
    func getRandomCocktail() async throws -> Cocktail
    func getCocktails(cocktailName name: String, isAlcoholic: Bool?) async throws -> [Cocktail]?
//    func getCocktailDetailById(idCocktail id: String) async throws-> Cocktail
}

enum DomainError: Error, Equatable {
    case generalError
    case noConnection
}
