//
//  LocalDataSource.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import Foundation

final class LocalDataSourceImplemententation: LocalDataSourceProtocol {

    func saveFavCocktail(cocktail: Cocktail) {
        UserDefaultsHelper.defaults.save(cocktail: cocktail)

        if let savedCocktails = UserDefaultsHelper.defaults.readCocktails() {
            print("Cocktail: \(savedCocktails.name), Category: \(cocktail.category.rawValue)")
            
        } else {
            print("No saved cocktails found.")
        }
    }
    
}
