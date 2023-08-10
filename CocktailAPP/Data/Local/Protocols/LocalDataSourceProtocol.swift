//
//  LocalDataSourceProtocol.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import Foundation


//impleemntas las funciones del localDataSource

//save delete

protocol LocalDataSourceProtocol{
//    func saveFavCocktail(cocktail: Cocktail)
    func addFavCocktail(cocktail: Cocktail)
    func removeFavCocktail(cocktailID: String)
    func readFavCocktails() -> [Cocktail]?
    func isFavorite(cocktailID: String) -> Bool
}
