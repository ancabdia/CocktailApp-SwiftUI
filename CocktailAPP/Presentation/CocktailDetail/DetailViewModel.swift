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
    
//    @Published var cocktail: Cocktail?
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func saveFav(cocktail: Cocktail){
        //TODO: - implement save to favorite the cocktail
        
        print("adding cocktail to array")
        print(cocktail)
        
        repository.addFavCocktail(cocktail: cocktail)
    }
    
    func deleteFav(){
        //TODO: - implement delete to favorite the cocktail
        print("deleting cocktail from arrray")
    }
}
