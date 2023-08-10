//
//  DetailViewModel.swift
//  CocktailAPP
//
//  Created by Cabrera Diaz Andrés on 8/8/23.
//

import Foundation
final class DetailViewModel: ObservableObject {
    // MARK: Properties
    private let repository: RepositoryProtocol //create a new LocalRepositoryProtocol and its Implementation that does the right and read from the dictFavCocktails
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func saveFav(cocktail: Cocktail){
        print("adding cocktail to array")
        repository.addFavCocktail(cocktail: cocktail)
    }
    
    func deleteFav(cocktail: Cocktail){
        print("deleting cocktail from arrray")
        repository.removeFavCocktail(cocktail: cocktail)
    }
    
    func isFavorite(cocktailID: String) -> Bool{
        repository.isFavorite(cocktailID: cocktailID)
    }
}
