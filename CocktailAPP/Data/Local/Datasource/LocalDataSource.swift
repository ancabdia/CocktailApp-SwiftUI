//
//  LocalDataSource.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import Foundation

final class LocalDataSourceImplemententation: LocalDataSourceProtocol {
    
    //https://stackoverflow.com/questions/44876420/save-struct-to-userdefaults
    
    var cocktails: [Cocktail]
    
    init() {
        cocktails = []
    }
    
    func addFavCocktail(cocktail: Cocktail){
        cocktails = readFavCocktails() ?? cocktails
        cocktails.append(cocktail)
        saveFavCocktails()
    }
    
    func removeFavCocktail(cocktailID: String){
        //remove cocktails with that ID
        cocktails = readFavCocktails() ?? cocktails
        cocktails.removeAll(where: { $0.id == cocktailID })
        saveFavCocktails()
    }
    
    private func saveFavCocktails(){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(cocktails), forKey: "cocktails")
    }
    
    func isFavorite(cocktailID: String) -> Bool{
        //read
        let cocktailsReaded = readFavCocktails()
        //filtrado
        let isFavor = cocktailsReaded?.contains(where: { cocktail in
            cocktail.id == cocktailID
        })
        
        return isFavor ?? false
    }
    
    func readFavCocktails() -> [Cocktail]? {
        if let data = UserDefaults.standard.value(forKey: "cocktails") as? Data {
            let cocktailsSaved = try? PropertyListDecoder().decode(Array<Cocktail>.self, from: data)
            return cocktailsSaved
        }
        return nil
    }
}
