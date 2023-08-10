//
//  MockRepository.swift
//  CocktailAPPTests
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import Foundation
@testable import CocktailAPP


//TODO: - Finish MockRepository class
final class MockRespository: RepositoryProtocol {
    
    var favCocktails: [Cocktail]?
    var cocktails: [Cocktail]
    
    public var errorRandomCocktail: Bool = false
    
    init(favCocktails: [Cocktail]? = nil) {
        self.favCocktails = favCocktails
        
        //populate cocktails
        self.cocktails = [
            Cocktail(id: "1001", name: "Cocktail1", video: nil, category: Category.cocktail, instructions: "cocktail 1", photo: nil, ingredients: [], measures: [], isAlcoholic: nil, isFavourite: false),
            Cocktail(id: "1002", name: "Cocktail2", video: nil, category: Category.ordinaryDrink, instructions: "cocktail 2", photo: nil, ingredients: [], measures: [], isAlcoholic: nil, isFavourite: false)
        ]
    }
    
    func addFavCocktail(cocktail: CocktailAPP.Cocktail) {
        favCocktails?.append(cocktail)
    }
    
    func removeFavCocktail(cocktail: CocktailAPP.Cocktail) {
        favCocktails?.removeAll(where: {$0.id == cocktail.id})
    }
    
    func getFavCocktails() -> [CocktailAPP.Cocktail]? {
        return favCocktails
    }
    
    func isFavourite(cocktailID: String) -> Bool {
        let isFavor = favCocktails?.contains(where: { cocktail in
            cocktail.id == cocktailID
        })
        
        return isFavor ?? false
    }
    
    func getRandomCocktail() async throws -> CocktailAPP.Cocktail? {
        if errorRandomCocktail {
            return nil
        }else{
            return cocktails.randomElement()
        }
        
    }
    
    func getCocktails(cocktailName name: String, isAlcoholic: Bool?) async throws -> [CocktailAPP.Cocktail]? {
        cocktails
    }
    
    
}
