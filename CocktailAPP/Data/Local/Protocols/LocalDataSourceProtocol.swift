//
//  LocalDataSourceProtocol.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import Foundation
protocol LocalDataSourceProtocol{
    func addFavCocktail(cocktail: Cocktail)
    func removeFavCocktail(cocktailID: String)
    func readFavCocktails() -> [Cocktail]?
    func isFavorite(cocktailID: String) -> Bool
}
