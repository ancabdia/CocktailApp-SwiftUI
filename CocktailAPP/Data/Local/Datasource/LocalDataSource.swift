//
//  LocalDataSource.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import Foundation

final class LocalDataSourceImplemententation: LocalDataSourceProtocol {
    
    var cocktails: [Cocktail]
    
    init() {
        self.cocktails = []
    }
    
    func addFavCocktail(cocktail: Cocktail){
        cocktails.append(cocktail)
        saveFavCocktails()
    }
    
    func removeFavCocktail(cocktailID: String){
        //remove cocktails with that ID
        cocktails.removeAll(where: { $0.id == cocktailID })
    }
    
    private func saveFavCocktails(){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(cocktails), forKey: "cocktails")
    }
    
    func isFavourite(cocktailID: String) -> Bool{
        //read
        
        //filtrado
        
        //return
        
        //TODO: - remove forced response
        return true
    }
    
    func readFavCocktails() -> [Cocktail]? {
        if let data = UserDefaults.standard.value(forKey: "cocktails") as? Data {
            let cocktailsSaved = try? PropertyListDecoder().decode(Array<Cocktail>.self, from: data)
            return cocktailsSaved
        }
        return nil
    }
}
